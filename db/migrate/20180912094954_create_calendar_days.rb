class CreateCalendarDays < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_days do |t|
      t.date :date, null: false
    end
  end
end
