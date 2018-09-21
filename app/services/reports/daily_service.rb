module Reports
  class DailyService 
    def initialize(params = {})
      @days = Calendar::Day.includes(:assigned_resources, :project_days)
      @resources = Resource.includes(:assigned_resources, :projects)
      @data = {}
    end

    def call
      @data[:days] = @days
      @data[:resources] = @resources
      Reports::BaseResult.new(data: @data, type: :render, endpoint: 'reports/daily')
    end
  end
end
