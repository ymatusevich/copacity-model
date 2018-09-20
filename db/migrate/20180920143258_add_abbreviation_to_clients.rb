class AddAbbreviationToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :abbreviation, :string
  end
end
