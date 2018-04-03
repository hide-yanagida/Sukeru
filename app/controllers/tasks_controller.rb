class TasksController < ApplicationController
  def create
    @task = Task.new(user_id: @current_user.id, request_id: params[:request_id])
    @task.save
    redirect_to("/requests/#{params[:request_id]}")
  end

  def destroy
    @task = Task.find_by(user_id: @current_user.id, request_id: params[:request_id])
    @task.destroy
    redirect_to("/requests/#{params[:request_id]}")
  end
end
