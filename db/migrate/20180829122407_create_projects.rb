class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string  :uid, limit: 5, index: true
      t.string  :name
      t.integer :hours
      t.integer :price
      t.integer :currency
      t.string  :status

      t.datetime :start_date
      t.datetime :end_date

      t.belongs_to :client

      t.timestamps
    end
  end
end
