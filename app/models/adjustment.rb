class Adjustment < ApplicationRecord
  belongs_to :project

  def date_pretty
    date&.strftime(Settings.date_format.first)
  end
end
