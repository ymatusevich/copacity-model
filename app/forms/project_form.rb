class ProjectForm < BaseForm
  attr_accessor :id, :uid, :name, :price, :currency, :status, :client_id, :start_date, :end_date,
                :assigned_resources, :estimations

  validates :uid, :name, :price, :currency, :status, :client_id, :start_date, :end_date, presence: true

  has_many :assigned_resources, class_name: AssignedResourceForm.to_s
  has_many :estimations, class_name: EstimationForm.to_s

  def initialize(params = {})
    @assigned_resources = []
    @estimations = []
    super
  end

  def build_assigned_resources
    AssignedResourceForm.new
  end

  def build_estimation
    EstimationForm.new
  end

  private

  def save!
    Project.connection.transaction do
      project = Project.new(project_params)
      project.save!

      assigned_resources.each do |ar|
        ar.project_id = project.id
        ar.save
      end

      estimations.each do |estimation|
        estimation.project_id = project.id
        estimation.save
      end
    end
  end

  def update!
    Project.connection.transaction do
      project = Project.find(id)
      project.update!(project_params)

      project.assigned_resources.delete_all

      assigned_resources.each do |ar|
        ar.project_id = project.id
        ar.save
      end

      project.estimations.delete_all

      estimations.each do |estimation|
        estimation.project_id = project.id
        estimation.save
      end
    end
  end

  def project_params
    {
        uid: uid,
        name: name,
        price: price,
        currency: currency,
        status: status,
        client_id: client_id,
        start_date: start_date,
        end_date: end_date
    }
  end
end
