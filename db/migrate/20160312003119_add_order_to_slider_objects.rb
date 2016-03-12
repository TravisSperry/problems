class AddOrderToSliderObjects < ActiveRecord::Migration
  def change
    add_column :order, :slider_objects, :integer
  end
end
