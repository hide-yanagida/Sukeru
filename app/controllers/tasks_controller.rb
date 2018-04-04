class TasksController < ApplicationController
  def create
    @task = Task.new(user_id: @current_user.id, request_id: params[:request_id])
    if @task.count > Task.where(request_id: params[:request_id]).count
      flash[:notice] = "すけます！"
      @task.save
    else
      flash[:notice] = "既に定員に達しているため参加できませんでした"
    end

    redirect_to("/requests/#{params[:request_id]}")
  end

  def destroy
    @task = Task.find_by(user_id: @current_user.id, request_id: params[:request_id])
    @task.destroy
    flash[:notice] = "やっぱすけません"
    redirect_to("/requests/#{params[:request_id]}")
  end
end
