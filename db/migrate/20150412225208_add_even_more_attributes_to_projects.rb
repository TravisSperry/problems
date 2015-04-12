class AddEvenMoreAttributesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :author_name, :string
    add_column :projects, :author_link, :string
    add_column :projects, :problem_statement, :text
  end
end
