class ReportService
  def initialize(resources, days)
    @resources = resources
    @days = days
    @data = {}
  end

  def call
    @resources.each do |resource|
      @data[resource.name] = { daily_report: {}, monthly_report: {}, year_report: {} }
      @days.each do |day|
        daily_time = day.prepare_data(resource)
        date = day.date
        month = date.month
        year = date.year
        @data[resource.name][:daily_report][date] = daily_time
        @data[resource.name][:monthly_report][month] ||= 0
        @data[resource.name][:year_report][year] ||= 0
        @data[resource.name][:monthly_report][month] += daily_time
        @data[resource.name][:year_report][year] += daily_time
      end
    end
    ServiceResult.new(data: @data)
  end

  private

  def year_report(recource, year)
  end

  def monthly_report(resource, month)
  end

  def daily_report(resource, day)
  end
end