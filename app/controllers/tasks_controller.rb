# frozen_string_literal: true

# tasks controller
class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: %i[destroy edit update]

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task.list_column.project,
                  notice: 'La tarea se creo correctamente'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @task.list_column.project,
                  notice: 'La tarea se actualizo correctamente'
    else
      render :edit
    end
  end

  def change_task_list
    @task = Task.find(params[:id])
    if @task.update(list_column_id: params[:list_column_id])
      render json: { head: :ok }
    else
      render json: 'error', status: unprocessable_entity
    end
  end

  def destroy
    project = @task.list_column.project
    return unless @task.destroy

    redirect_to project, notice: 'El proyecto se actualizo correctamente'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:list_column_id, :title, :description,
                                 :user_id)
  end
end
