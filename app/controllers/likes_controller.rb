class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: @current_user.id, request_id: params[:request_id])
    @like.save
    redirect_to("/users/#{@current_user.id}/watch")
  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id, request_id: params[:request_id])
    @like.destroy
    redirect_to("/users/#{@current_user.id}/watch")
  end
end
