class ProjectField < ActiveRecord::Base
  belongs_to :project

  TYPES = ["DETAILS" , "OTHER"]
end
