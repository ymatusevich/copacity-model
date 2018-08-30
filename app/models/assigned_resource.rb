class AssignedResource < ApplicationRecord
  belongs_to :resource_id
  belongs_to :project_id
end
