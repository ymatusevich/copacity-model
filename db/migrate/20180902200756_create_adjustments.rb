class CreateAdjustments < ActiveRecord::Migration[5.2]
  def change
    create_table :adjustments do |t|
      t.datetime :date
      t.belongs_to :project

      t.timestamps
    end
  end
end
