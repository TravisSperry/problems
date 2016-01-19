class CreateProjectOtherFields < ActiveRecord::Migration
  def change
    create_table :project_other_fields do |t|
      t.string :name
      t.text :content
      t.integer :position
      t.integer :project_id

      t.timestamps
    end
  end
end
