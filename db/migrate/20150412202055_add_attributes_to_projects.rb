class AddAttributesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :statement, :text
    add_column :projects, :type_id, :integer
    add_column :projects, :why, :text
    add_column :projects, :duration, :string
    add_column :projects, :launch_method, :text
    add_column :projects, :teacher_moves, :text
  end
end
