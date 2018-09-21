# frozen_string_literal: true

module Reports
  class BaseResult
    attr_accessor :data, :type, :endpoint

    def initialize(data:, type:, endpoint:)
      @data = data
      @type = type
      @endpoint = endpoint
    end
  end
end
