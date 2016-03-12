class AddOrderToSliderObjects < ActiveRecord::Migration
  def change
    add_column :slider_objects, :order, :integer
  end
end
