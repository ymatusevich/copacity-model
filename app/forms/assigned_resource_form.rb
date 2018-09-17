class AssignedResourceForm < BaseForm
  attr_accessor :id, :resource_id, :project_id, :resource_type_id, :start_date, :end_date, :involvement, :_destroy,
                :forecast_type_id

  validates :resource_id, :resource_type_id, presence: true, numericality: { only_integer: true }

  private

  def save!
    resource = AssignedResource.new(assigned_resource_params)
    resource.save!

    resource.project_days.destroy_all
    resource.working_days.each do |day|
      calendar_day = find_calendar_day(day.to_date)
      project_day = ProjectDayForm.new(
                                        calendar_day_id: calendar_day.id,
                                        assigned_resource_id: resource.id,
                                        resource_id: resource_id,
                                        project_id: project_id
                                      )

      raise ActiveRecord::Rollback unless project_day.save
    end
  end

  def assigned_resource_params
    {
        resource_id: resource_id,
        project_id: project_id,
        resource_type_id: resource_type_id,
        start_date: start_date,
        end_date: end_date,
        involvement: involvement,
        forecast_type_id: forecast_type_id
    }
  end

  def find_calendar_day(date)
    Calendar::Day.find_or_create_by!(date: date)
  end
end
