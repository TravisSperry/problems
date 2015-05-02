class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable,
         :trackable, :validatable

  validates_confirmation_of :password

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
end
