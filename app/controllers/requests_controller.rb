class RequestsController < ApplicationController
  def new
    @request = Request.new()
  end

  def create
    @request = Request.new(
      user_id: @current_user.id,
      title: params[:title],
      content: params[:content],
      from_date: params[:from_date],
      from_time: params[:from_time],
      to_date: params[:to_date],
      to_time: params[:to_time],
      address: params[:address],
      reward: params[:reward]
    )

    if @request.save
      flash[:notice] = "リクエストを登録しました"
      redirect_to("/requests/index")
    else
      render("requests/new")
    end
  end

  def index
    @requests = Request.all.order(updated_at: :desc)
  end

  def show
    @request = Request.find_by(id: params[:id])
  end
end
