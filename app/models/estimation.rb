# frozen_string_literal: true

class Estimation < ApplicationRecord
  scope :by_type, ->(type) { where(resource_type_id: type) }
  scope :total,   ->(type) { by_type(type).sum(:hours) }
  belongs_to :project

  def resource_type_name
    Settings.resource_types.to_h.key(resource_type_id)
  end
end
