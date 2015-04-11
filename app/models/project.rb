class Project < ActiveRecord::Base
  searchable do
    text :name, :content
  end
end
