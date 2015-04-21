class AddFileNameToResources < ActiveRecord::Migration
  def change
    add_column :project_attachments, :file_name, :string
  end
end
