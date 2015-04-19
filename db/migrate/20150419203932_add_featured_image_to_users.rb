class AddFeaturedImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :featured_image, :string
  end
end
