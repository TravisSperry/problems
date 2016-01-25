class RemoveTypeFromField < ActiveRecord::Migration
  def change
    remove_column :project_fields, :type_id
  end
end
