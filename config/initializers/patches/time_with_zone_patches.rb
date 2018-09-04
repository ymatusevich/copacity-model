class ActiveSupport::TimeWithZone
  def pretty
    strftime(Settings.date_format.first)
  end
end
