class CalendarDay < ApplicationRecord
  has_many :project_days, dependent: :destroy
  has_many :assigned_resources, through: :project_days

  validates :date, uniqueness: true

  def prepare_data(resource)
    project_days.includes(:assigned_resource).where(resource_id: resource.id).sum do |pd|
      pd.assigned_resource&.consumed_per_day || 0
    end
  end
end
