class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_user
    @current_user ||= if session[:user_id]
      User.find_by_id(session[:user_id])
    elsif cookies.include? :remember_token
      User.find_by_remember_token(cookies.fetch(:remember_token, nil))
    end
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.try(:id)
    cookies[:remember_token] = { :value => user.try(:remember_token), :expires => 31.days.from_now }
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
