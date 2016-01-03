class AddDefToProj < ActiveRecord::Migration
  def change
    change_column_default :projects, :form_order, '01'
  end
end
