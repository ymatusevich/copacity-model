class NewProjectForm < BaseForm
  attr_accessor :uid, :name, :hours, :price, :currency, :status, :client_id

  validates :uid, :name, :hours, :price, :currency, :status, :client_id, presence: true

  def save
    return false unless valid?

    persist!
    true
  end

  private

  def persist!
    binding.pry
    Project.create!(params)
  end
end
