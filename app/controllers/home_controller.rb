class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  def top
    @requests_timely = Request.all.order(updated_at: :desc).limit(4)
  end
end
