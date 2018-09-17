class ProjectDay < ApplicationRecord
  belongs_to :assigned_resource
  belongs_to :calendar_day, class_name: 'Calendar::Day'

  def resource
    Resource.find(resource_id)
  end

  def project
    Project.find(project_id)
  end
end
