class AssignedResource < ApplicationRecord
  belongs_to :resource
  belongs_to :project

  def resource_type_name
    Settings.resource_types.to_h.key(resource_type_id)
  end

  def allocated_time
    working_hours = (resource.general_capacity.to_f / 100) * Settings.assumptions.working_hours.to_f
    (involvement.to_f / 100) * working_hours
  end
end
