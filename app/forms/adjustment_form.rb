class AdjustmentForm < BaseForm
  attr_accessor :id, :date, :project_id

  validates :date, presence: true

  private

  def save!
    project = Project.find(project_id)
    project.adjustments.build(date: date)
    project.save!
  end

  def update!
  end
end
