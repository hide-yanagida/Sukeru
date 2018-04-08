class User < ApplicationRecord
  has_secure_password
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, :presence => true, :on => :create

  def requests
    return Request.where(user_id: self.id)
  end

  #残枠数を返す
  def remaining
    request_number = Request.find_by(id: self.request_id).number
    task_count = Task.where(request_id: self.request_id).count
    remaining = request_number - task_count
    if remaining == 0
      message = "定員に達しています"
    else
      message = "あと#{remaining}人"
    end

    return message
  end

  def likes_count
    return Like.where(request_id: self.id).count
  end

end
