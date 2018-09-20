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

  def select_status_tag
    html_params = { prompt: 'all statuses', onchange: 'this.form.submit();', class: 'btn-outline-secondary form-control' }
    statuses = Project::STATUS.keys.map { |x| [x.to_s.humanize, x ] }

    select_tag :status, options_for_select(statuses, params[:status]), html_params
  end

  def select_client_tag
    html_params = { prompt: 'all clients', onchange: 'this.form.submit();', class: 'btn-outline-secondary form-control' }

    select_tag :client_id, options_for_select(Client.pluck(:name, :id), params[:client_id]), html_params
  end
end
