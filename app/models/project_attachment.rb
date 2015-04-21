class ProjectAttachment < ActiveRecord::Base
  mount_uploader :resource, ResourceUploader
  belongs_to :project
end
