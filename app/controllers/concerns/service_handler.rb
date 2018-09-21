# frozen_string_literal: true

module ServiceHandler
  def with_service_handling
    yield
  ensure
    render_or_redirect
  end

  def render_or_redirect
    return if @result.blank?

    case @result.type
    when :render
      render @result.endpoint
    when :redirect
      redirect_to @result.endpoint
    end
  end
end
