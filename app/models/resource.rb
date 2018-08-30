class Resource < ApplicationRecord
  has_many :projects, through: :assigned_projects
  has_many :assigned_projects, class_name: 'AssignedResources'
end
