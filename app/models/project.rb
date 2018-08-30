class Project < ApplicationRecord
  belongs_to :client
  has_many :resources, through: :assigned_resources
  has_many :assigned_resources
end
