module ProjectsHelper
  def status_class(project)
    Settings.project.classes.to_h[project.status_name]
  end
end
