class Project < ActiveRecord::Base

  has_one :type
  has_and_belongs_to_many :tags

  mount_uploader :featured_image, FeaturedImageUploader

  searchable do
    text :name, :content, :statement, :author_name, :history, :extensions

    text :tags do
      tags.map { |tag| tag.name }
    end
  end
end
