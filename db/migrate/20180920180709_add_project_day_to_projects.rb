class AddProjectDayToProjects < ActiveRecord::Migration[5.2]
  def change
    change_column :project_days, :project_id, :bigint
    add_foreign_key :project_days, :projects
  end
end
