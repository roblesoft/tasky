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
      redirect_to root_path, notice: 'Bienvenido'
    else
      flash[:error] = 'El correo ya ha sido registrado'
      render :sign_up
    end
  end

  def sign_out
    session[:user_id] = nil
    flash[:success] = 'Haz salido correctamente'
    redirect_to new_session_homes_path
  end

  def new_session
    user = User.find_by(email: params[:log_in][:email])

    if user
      session[:user_id] = user.id
      flash[:success] = 'Bienvenido'
      redirect_to projects_path
    else
      flash[:error] = 'El usuario no se encontro'
      redirect_to login_homes_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :name)
  end
end
