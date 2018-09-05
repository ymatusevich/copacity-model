class AssignedResource < ApplicationRecord
  scope :by_type, -> (id) { where(resource_type_id: id) }

  belongs_to :resource
  belongs_to :project

  def distribution?
    forecast_type_id == 0
  end

  def allocation?
    !distribution?
  end

  def resource_type_name
    Settings.resource_types.to_h.key(resource_type_id)
  end

  def allocated_per_day
    work_day_time * (involvement.to_f / 100)
  end

  def work_day_time
    (resource.general_capacity.to_f / 100) * Settings.assumptions.working_hours.to_f
  end

  def hours_consumed
    start = (start_date.presence || project.start_date).to_date
    finish = (end_date.presence || project.end_date).to_date
    business_days = start.business_days_until(finish)
    business_days + 1 if start.workday?
    total_estimation = project.estimations.total(resource_type_id).to_f

    return (work_day_time.to_f * business_days.to_f).round(1) if distribution?

    assigned_time = allocated_per_day * business_days.to_f
    (assigned_time > total_estimation ? total_estimation : assigned_time).round(1)
  end
end
