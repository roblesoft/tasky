# frozen_string_literal: true

# application controller
class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :set_current_user

  private

  def set_current_user
    Task.current_user = current_user
    Project.current_user = current_user
    ListColumn.current_user = current_user
  end

  def authenticate_user!
    redirect_to login_homes_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
