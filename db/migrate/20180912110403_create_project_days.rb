class CreateProjectDays < ActiveRecord::Migration[5.2]
  def change
    create_table :project_days do |t|
      t.belongs_to :calendar_day, index: true
      t.belongs_to :assigned_resource, index: true

      t.integer :resource_id, index: true
      t.integer :project_id, index: true
    end
  end
end
