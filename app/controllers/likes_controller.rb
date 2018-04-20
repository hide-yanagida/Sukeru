class LikesController < ApplicationController
  before_action :authenticate_user
  
  def create
    @like = Like.new(user_id: @current_user.id, request_id: params[:request_id])
    @like.save

    redirect_back(fallback_location: "/requests")
  end

  def destroy
    @like = Like.find_by(user_id: @current_user.id, request_id: params[:request_id])
    @like.destroy

    redirect_back(fallback_location: "/requests")
  end
end
