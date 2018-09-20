module ProjectsHelper
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
