class WelcomeController < ApplicationController

  layout 'landing'
  before_action :enter_if_logged_in

  def index
  end

  private

  def enter_if_logged_in
    if current_user
      redirect_to home_path and return
    end
  end

end
