class AddTitleToProjectAttachments < ActiveRecord::Migration
  def change
    add_column :project_attachments, :title, :string, default: ""
  end
end
