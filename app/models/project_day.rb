class ProjectDay < ApplicationRecord
  belongs_to :assigned_resource
  belongs_to :calendar_day, class_name: 'Calendar::Day'
  belongs_to :project

  delegate :date, to: :calendar_day

  def resource
    Resource.find(resource_id)
  end
end
