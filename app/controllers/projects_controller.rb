# frozen_string_literal: true

# Projects controller
class ProjectsController < ApplicationController
  before_action :set_project, only: %i[newsfeed show edit update destroy]

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
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    return unless @project.destroy

    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :status)
  end
end
