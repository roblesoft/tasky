# frozen_string_literal: true

# homes controller
class HomesController < ApplicationController
  before_action :authenticate_user!, except: %i[login new_session]

  def login; end

  def newsfeed; end

  def new_session
    user = User.find_by(email: params[:log_in][:email])

    if user
      session[:user_id] = user.id
      flash[:success] = 'The login was successfully completed'
    else
      flash[:error] = 'User not found'
    end
    redirect_to newsfeed_homes_path
  end
end
