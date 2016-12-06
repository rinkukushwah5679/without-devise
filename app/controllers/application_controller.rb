class ApplicationController < ActionController::Base
    


  protect_from_forgery with: :exception
  helper_method :current_user

  def authenticate_user!
  	redirect_to "/users/sign_in" if current_user.blank?
  end

  def current_user
  	User.find_by_id(session[:user_id])
  end
end
