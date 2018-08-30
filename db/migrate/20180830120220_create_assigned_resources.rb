class CreateAssignedResources < ActiveRecord::Migration[5.2]
  def change
    create_table :assigned_resources do |t|
      t.belongs_to :resources, foreign_key: true
      t.belongs_to :projects, foreign_key: true
      t.integer :resource_type_id

      t.timestamps
    end
  end
end
