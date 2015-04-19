class AddAttributesFromMeetingToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :history, :text
    add_column :projects, :pathways, :text
    add_column :projects, :pitfalls, :text
    add_column :projects, :extensions, :text
    add_column :projects, :hints, :text
  end
end
