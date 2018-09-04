class AddFieldsToAssignedResources < ActiveRecord::Migration[5.2]
  def change
    add_column :assigned_resources, :involvement, :integer
    add_column :assigned_resources, :start_date, :datetime
    add_column :assigned_resources, :end_date, :datetime
    add_column :assigned_resources, :forecast_type_id, :integer
  end
end
