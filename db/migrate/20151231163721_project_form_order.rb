class ProjectFormOrder < ActiveRecord::Migration
  def change
    add_column :projects, :form_order, :string
  end
end
