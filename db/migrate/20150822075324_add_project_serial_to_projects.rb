class AddProjectSerialToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_serial, :string
  end
end
