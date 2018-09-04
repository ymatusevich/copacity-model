class CreateAssignedResources < ActiveRecord::Migration[5.2]
  def change
    create_table :assigned_resources do |t|
      t.belongs_to :resource
      t.belongs_to :project
      t.integer :resource_type_id

      t.timestamps
    end
  end
end
