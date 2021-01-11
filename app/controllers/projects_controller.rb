# frozen_string_literal: true

# Projects controller
class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :add_user_params, only: %i[add_user]
  before_action :set_project, only: %i[add_user newsfeed show edit
                                       update destroy]

  def add_user
    return user_already_added \
      if @project.user_projects.where(user_id: @user&.id).any?

    return user_added_success if @user && !@role.nil?

    flash[:error] = 'El usuario no se encontro'
    redirect_to @project
  end

  def index
    @projects = current_user.projects
  end

  def show
    @list_columns = Project.includes(list_columns: [tasks: :user])
                           .find(params[:id]).list_columns
  end

  def newsfeed
    @events = Project.includes(project_events: %i[eventable user])
                     .find(params[:id]).project_events.order('created_at desc')
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)
    if @project.save
      @project.assign_owner(current_user)
      redirect_to @project, notice: 'El proyecto se creo exitosamente'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'El proyecto se actualizo'
    else
      render :edit
    end
  end

  def destroy
    return unless @project.destroy

    redirect_to projects_url, notice: 'El proyecto se borro correctamente'
  end

  private

  def user_added_success
    @project.user_projects.create(user: @user, role: @role)
    flash[:success] = 'El usuario se agrego correctamente'
    redirect_to @project
  end

  def user_already_added
    flash[:error] = 'El usuario ya se encuentra agregado'
    redirect_to @project
  end

  def add_user_params
    @user = User.find_by(email: params[:add_user][:email])
    @role = UserProject.roles.key(params[:add_user][:role].to_i)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :status)
  end
end
