class RemoveProjectDetails < ActiveRecord::Migration
  def change
    remove_column :projects, :history
    remove_column :projects, :duration
    remove_column :projects, :why
    remove_column :projects, :launch_method
    remove_column :projects, :teacher_moves
    remove_column :projects, :pathways
    remove_column :projects, :pitfalls
    remove_column :projects, :extensions
    remove_column :projects, :hints
  end
end
