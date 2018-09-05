module ProjectsHelper
  def status_class(project)
    Settings.project.classes.to_h[project.status_name]
  end

  def resource_type_name(id)
    Settings.resource_types.to_h.key(id)
  end
end
