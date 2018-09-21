# frozen_string_literal: true

class ReportsFactory < BaseFactory
  def initialize
    @storage = {
      day: 'Reports::DailyService',
      month: 'Reports::MonthlyService',
      resource: 'Reports::ResourcesService'
    }.with_indifferent_access
  end
end
