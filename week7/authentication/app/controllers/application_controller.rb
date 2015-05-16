class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_cookies


  private

  def is_loged_in?
    session[:user_id] != nil
  end

  def redirect_if_not_loged_in
    unless is_loged_in?
      redirect_to root_path
    end
  end

  def redirect_if_loged_in
    if is_loged_in?
      redirect_to user_path
    end
  end

  def check_cookies
    if cookies[:user_id]
      session[:user_id] = cookies[:user_id]
    end
  end
end
