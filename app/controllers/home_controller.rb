class HomeController < ApplicationController

  def index
    @user_name = current_user.name if logged_in?
  end
end
