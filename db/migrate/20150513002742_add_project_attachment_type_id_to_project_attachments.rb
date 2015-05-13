class AddProjectAttachmentTypeIdToProjectAttachments < ActiveRecord::Migration
  def change
    add_column :project_attachments, :project_attachment_type_id, :integer
  end
end
