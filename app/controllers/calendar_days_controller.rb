class CalendarDaysController < ApplicationController
  before_action :populate_calendar_days

  def index
    @days = CalendarDay.includes(:assigned_resources, :project_days)
    @resources = Resource.includes(:assigned_resources, :projects)
  end

  private

    def populate_calendar_days
      Project.transaction do
        (Project.minimum(:start_date).to_date..Project.maximum(:end_date).to_date).each do |date|
          CalendarDay.includes(:assigned_resources).find_or_create_by!(date: date)
        end
      end
    end
end
