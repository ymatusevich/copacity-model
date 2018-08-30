module ApplicationHelper
  def dashboard_link_to(name = nil, options = nil, html_options = nil, &block)
    html_options, options = options, name if block_given?
    url = url_for(options)
    html_options ||= { class: '' }
    html_options[:class] += ' active'  if request.path == url

    block_given? ? link_to(options, html_options) { yield } : link_to(name, options, html_options)
  end
end
