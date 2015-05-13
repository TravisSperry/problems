class CreateProjectAttachmentTypes < ActiveRecord::Migration
  def change
    create_table :project_attachment_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
