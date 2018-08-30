class LoginUserService < BaseService
  def call
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      sign_in(@user, event: :authentication)
      ServiceResult.new(data: user)
    else
      this.fail
    end
  end

  private
end
