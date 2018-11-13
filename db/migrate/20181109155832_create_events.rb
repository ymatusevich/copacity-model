class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date, allow_nil: false
      t.datetime :end_date, allow_nil: false
      t.string :html_link
      t.string :status
      t.string :summary
      t.string :creator_name
      t.string :creator_email, allow_nil: false
      t.string :type, allow_nil: false
    end
  end
end
