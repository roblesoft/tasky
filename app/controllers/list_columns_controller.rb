# frozen_string_literal: true

# list columns controller
class ListColumnsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: %i[create edit update destroy]
  before_action :set_list_column, only: %i[edit update destroy]

  def create
    @list = @project.list_columns.new(list_column_params)
    if @list.save
      redirect_to @project, notice: 'list was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @list_column.update(list_column_params)
      redirect_to @list_column.project,
                  notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    return unless @list_column.destroy

    redirect_to @project, notice: 'Task was successfully destroyed.'
  end

  private

  def set_list_column
    @list_column = ListColumn.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def list_column_params
    params.require(:list_column).permit(:title, :description, :project_id)
  end
end
