class Project < ActiveRecord::Base

  has_one :type
  has_and_belongs_to_many :tags
  has_many :project_attachments
  accepts_nested_attributes_for :project_attachments

  mount_uploader :featured_image, FeaturedImageUploader

  searchable do
    text :name, :content, :author_name, :history, :extensions

    text :tags do
      tags.map { |tag| tag.name }
    end
  end
end
