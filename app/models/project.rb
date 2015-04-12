class Project < ActiveRecord::Base

  has_one :type
  has_and_belongs_to_many :tags

  # mount_uploader :image, ImageUploader

  searchable do
    text :name, :content
  end
end
