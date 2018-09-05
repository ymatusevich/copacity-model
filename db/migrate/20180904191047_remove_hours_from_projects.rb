class RemoveHoursFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :hours, :integer
  end
end
