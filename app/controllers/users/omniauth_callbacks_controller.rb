class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    service = LoginUserService.new
    result = service.call

    if result.success?
      redirect_to root_path
    else
      render file: 'public/403.html', status: 403, layout: false
    end
  end
end
