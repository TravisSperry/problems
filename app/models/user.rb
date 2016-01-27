class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable,
         :trackable, :validatable

  validates_confirmation_of :password

  mount_uploader :featured_image, ResourceUploader
  has_many :projects

  def full_name
    first_name + ' ' + last_name
  end

  def projects_drafted
    projects.where(status: 0)
  end

  def projects_published
    projects.where(status: 2)
  end

  def projects_pending_review
    projects.where(status: 1)
  end
end
