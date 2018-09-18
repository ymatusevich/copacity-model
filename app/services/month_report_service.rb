# frozen_string_literal: true

class MonthReportService
  def initialize(resources, days)
    @days = days
    @data = {}
  end

  def call
    Date::MONTHNAMES.compact.each do |month|
      @data[month] = Calendar::Month.new(@days, month, 2018)
    end
    ServiceResult.new(data: @data)
  end
end
