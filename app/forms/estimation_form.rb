# frozen_string_literal: true

class EstimationForm < BaseForm
  attr_accessor :id, :project_id, :hours, :resource_type_id, :_destroy

  validates :hours, :resource_type_id, :project_id, presence: true

  private

  def save!
    estimation = Estimation.new(estimation_params)
    estimation.save!
  end

  def estimation_params
    {
      hours: hours,
      project_id: project_id,
      resource_type_id: resource_type_id
    }
  end
end
