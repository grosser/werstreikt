class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.try(:id)
    @current_user = user
  end

  def login_required
    return if current_user
    session[:redirect_after_login] = params
    redirect_to new_user_path, :error => "Bitte melde dich an!"
  end

  def redirect_back_or_default(default)
    redirect_to request.headers["Referer"] || default
  end
end
