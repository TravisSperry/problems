class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :code
      t.string :category
      t.string :subcategory

      t.timestamps
    end
  end
end
