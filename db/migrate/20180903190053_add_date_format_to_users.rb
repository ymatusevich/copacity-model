class AddDateFormatToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :date_format, :string
  end
end
