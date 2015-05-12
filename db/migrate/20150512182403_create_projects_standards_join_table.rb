class CreateProjectsStandardsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :projects, :standards do |t|
      t.index [:project_id, :standard_id]
      t.index [:standard_id, :project_id]
    end
  end
end
