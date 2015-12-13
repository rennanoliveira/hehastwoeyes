module ApplicationHelper

  def facebook_login
    login_button(:facebook, 'btn-primary', 'facebook')
  end

  def visitor_link
    link_to('', class: 'btn btn-lg btn-block') do
      'Check it out as a Visitor'
      # fa_icon 'user-secret', text: ' Check it out as a Visitor'
    end
  end

  def login_button(provider, btn_class, font_awesome_class)
    login_message = ' Sign in with ' + provider.to_s.capitalize
    link_to(user_omniauth_authorize_path(provider),
            class: "btn btn-lg btn-block #{btn_class}") do
      fa_icon font_awesome_class, text: login_message
    end
  end

  def alert_type(key)
    key == 'notice' ? 'success' : 'warning'
  end

  def your_managed_groups
    current_user.managed_groups
  end

  def your_groups
    current_user.groups
  end

end
