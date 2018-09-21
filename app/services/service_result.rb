# frozen_string_literal: true

class ServiceResult
  attr_reader :data

  def initialize(options = {})
    @options = options
    @success = options.fetch(:success, true)
    @data = options.fetch(:data, {})
  end

  def success?
    @success
  end

  def failure?
    !@success
  end
end
