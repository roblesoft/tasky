# frozen_string_literal: true

# tasks controller
class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task.list_column.project,
                  notice: 'Task was successfully created.'
    else
      render :new
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

  private

  def task_params
    params.require(:task).permit(:list_column_id, :title, :description,
                                 :user_id)
  end
end
