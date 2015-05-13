class ProjectAttachment < ActiveRecord::Base
  mount_uploader :resource, ResourceUploader

  belongs_to :project
  belongs_to :project_attachment_type

  before_create :default_name

  def default_name
    self.file_name = File.basename(resource.file.path, '.*').gsub("_", " ")
  end
end
