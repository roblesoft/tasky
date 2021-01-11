# frozen_string_literal: true

# homes controller
class HomesController < ApplicationController
  before_action :authenticate_user!,
                except: %i[login new_session sign_up new_registry]

  def login; end

  def newsfeed; end

  def sign_up
    @user = User.new
  end

  def new_registry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :sign_up
    end
  end

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

  private

  def user_params
    params.require(:user).permit(:email, :username, :name)
  end

end
