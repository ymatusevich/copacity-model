class ProjectDayForm < BaseForm
  attr_accessor :project_id, :resource_id, :calendar_day_id, :assigned_resource_id
  validates :project_id, :resource_id, :calendar_day_id, :assigned_resource_id, presence: true

  private

    def save!
      project_day = ProjectDay.new(project_day_params)
      project_day.save!
    end

    def project_day_params
      {
          calendar_day_id: calendar_day_id,
          resource_id: resource_id,
          project_id: project_id,
          assigned_resource_id: assigned_resource_id
      }
    end
end
