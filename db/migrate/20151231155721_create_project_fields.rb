class CreateProjectFields < ActiveRecord::Migration
  def change
    create_table :project_fields do |t|
      t.integer :type_id
      t.integer :project_id
      t.string :name
      t.text :content
      t.integer :position
    end
  end
end
