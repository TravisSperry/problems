class ProjectAttachment < ActiveRecord::Base
  mount_uploader :resource, ResourceUploader

  belongs_to :project
  belongs_to :project_attachment_type

  before_save :default_name
  # before_validation :mark_for_destruction

  def default_name
    self.file_name = File.basename(resource.file.path, '.*').gsub("_", " ")
  end

  def mark_for_removal
    unless resource
      mark_for_destruction
    end
  end
end
