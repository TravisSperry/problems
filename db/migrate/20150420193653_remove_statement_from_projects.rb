class RemoveStatementFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :statement, :text
  end
end
