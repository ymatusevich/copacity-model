class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :resource_type_id
      t.integer :general_capacity

      t.timestamps
    end
  end
end
