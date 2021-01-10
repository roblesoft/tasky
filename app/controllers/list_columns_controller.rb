# frozen_string_literal: true

# list columns controller
class ListColumnsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[create]

  def create
    @list = @project.list_columns.new(list_column_params)
    if @list.save
      redirect_to @project, notice: 'list was successfully created.'
    else
      render :new
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def list_column_params
    params.require(:list_column).permit(:title, :description, :project_id)
  end
end
