class RequestsController < ApplicationController
  def new
    @request = Request.new()
  end

  def create
    @request = Request.new(
      user_id: @current_user.id,
      title: params[:title],
      content: params[:content],
      from_datetime: params[:from_datetime],
      to_datetime: params[:to_datetime],
      address: params[:address],
      reward: params[:reward],
      number: params[:number]
    )

    if @request.save
      flash[:notice] = "リクエストを登録しました"
      redirect_to("/requests")
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

  def edit
    @request = Request.find_by(id: params[:id])
  end

  def update
    @request = Request.find_by(id: params[:id])

    @request.title = params[:title]
    @request.content = params[:content]
    @request.from_datetime = params[:from_datetime]
    @request.to_datetime = params[:to_datetime]
    @request.address = params[:address]
    @request.reward = params[:reward]
    @request.number = params[:number]

    if @request.save
      flash[:notice] = "リクエストを編集しました"
      redirect_to("/requests/#{@request.id}")
    else
      render("requests/edit")
    end
  end

  def destroy
    @request = Request.find_by(id: params[:id])
    @request.tasks_destroy
    @request.likes_destroy
    @request.destroy
    flash[:notice] = "リクエストを削除しました"
    redirect_to("/users/#{@current_user.id}")
  end

end
