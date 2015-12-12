class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def failure
    redirect_to root_path, flash: { error: 'We were unable to authenticate you.' }
  end

  def callback_for(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user,
                           event: :authentication
      set_flash_message(:notice,
                        :success,
                        kind: provider.to_s.humanize) if is_navigational_format?
    else
      byebug
      redirect_to root_path, flash: { error: 'Sorry, an error occurred.' }
    end
  end
end
