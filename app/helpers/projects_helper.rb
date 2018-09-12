module ProjectsHelper
  def status_class(project)
    Settings.project.classes.to_h[project.status_name]
  end

  def resource_type_name(id)
    Settings.resource_types.to_h.key(id)
  end

  def currency_name(currency)
    Settings.currencies.to_h.key(currency)
  end
end
