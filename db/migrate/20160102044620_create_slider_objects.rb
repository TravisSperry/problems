class CreateSliderObjects < ActiveRecord::Migration
  def change
    create_table :slider_objects do |t|
      t.text :description
      t.string :file_name
      t.integer :project_id
      t.string :resource
      t.integer :position

      t.timestamps
    end
  end
end
