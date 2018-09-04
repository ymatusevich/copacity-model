class ProjectForm < BaseForm
  attr_accessor :id, :uid, :name, :hours, :price, :currency, :status, :client_id, :assigned_resources,
                :start_date, :end_date

  validates :uid, :name, :hours, :price, :currency, :status, :client_id, :start_date, :end_date, presence: true

  has_many :assigned_resources, class_name: AssignedResourceForm.to_s

  def initialize(params = {})
    @assigned_resources = []
    super
  end

  def save
    return false unless valid?

    create!
  end

  def update
    return false unless valid?

    update!
  end

  def build_assigned_resources
    AssignedResourceForm.new
  end

  private

  def create!
    Project.connection.transaction do
      project = Project.new(project_params)
      project.save!

      assigned_resources.each do |ar|
        ar.project_id = project.id
        ar.save
      end
    end

    true
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
    end
  end

  def project_params
    {
        uid: uid,
        name: name,
        hours: hours,
        price: price,
        currency: currency,
        status: status,
        client_id: client_id,
        start_date: start_date,
        end_date: end_date
    }
  end
end
