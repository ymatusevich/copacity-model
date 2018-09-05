class CreateEstimations < ActiveRecord::Migration[5.2]
  def change
    create_table :estimations do |t|
      t.belongs_to :project

      t.integer :resource_type_id
      t.integer :hours
    end
  end
end
