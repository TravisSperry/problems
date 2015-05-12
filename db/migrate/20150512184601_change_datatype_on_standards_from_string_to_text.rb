class ChangeDatatypeOnStandardsFromStringToText < ActiveRecord::Migration
  def up
    change_column :standards, :subcategory, :text, :limit => nil
  end

  def down
    change_column :standards, :subcategory, :string
  end
end
