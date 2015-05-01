class Project < ActiveRecord::Base

  has_one :type
  has_and_belongs_to_many :tags
  has_many :project_attachments, dependent: :destroy
  accepts_nested_attributes_for :project_attachments
  belongs_to :user

  mount_uploader :featured_image, FeaturedImageUploader

  if Rails.env.development?
    searchable do
      text :name, :content, :author_name, :history, :extensions

      text :tags do
        tags.map { |tag| tag.name }
      end
    end
  else
    def search

    end
  end

  STATUSES = ['Draft', 'Pending Review', 'Published']
end
