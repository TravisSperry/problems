class ResourceUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :thumbnail_pdf
  end

  def thumbnail_pdf
    manipulate! do |img|
      img.format("png", 1)
      img.resize("150x150")
      img = yield(img) if block_given?
      img
    end
  end

  protected
    def image?(new_file)
      new_file.content_type.start_with? 'image'
    end
end
