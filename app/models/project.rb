class Project < ApplicationRecord
  belongs_to :client
  has_many :adjustments, dependent: :destroy
  has_many :assigned_resources, dependent: :destroy
  has_many :resources, through: :assigned_resources

  accepts_nested_attributes_for :assigned_resources, reject_if: :all_blank, allow_destroy: true

  def assigned_resources_attributes
    return {} if assigned_resources.blank?
    param =
      assigned_resources.inject({}) do |memo, r|
        memo[r.id.to_s] = r.attributes
        memo
      end

    { 'assigned_resources_attributes' => param }
  end

  def status_name
    Settings.project.status.to_h.key(status.to_i)
  end

  def code_complete_date
    Settings.assumptions.code_complete_prior.business_days.before(end_date)
  end

  def unallocated_hours
    total_hours = hours.to_f + (hours.to_f * Settings.assumptions.estimate_buffer.to_f / 100)

    allocated_time = assigned_resources.inject(0.0) do |memo, resource|
      start = (resource.start_date.presence || start_date).to_date
      finish = (resource.end_date.presence || end_date).to_date
      business_days = start.business_days_until(finish)

      memo += resource.allocated_time * business_days
    end

    allocated_time
  end
end
