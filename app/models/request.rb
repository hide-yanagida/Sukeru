class Request < ApplicationRecord
  validates :title, {presence: true}
  validates :content, {presence: true}
  validates :from_datetime, {presence: true}
  validates :to_datetime, {presence: true}
  validates :address, {presence: true}
  validates :reward, {presence: true}
  validates :number, {presence: true}


  def user
    return User.find_by(id: self.user_id)
  end

  #残枠数を返す
  def remaining
    request_number = Request.find_by(id: self.id).number
    task_count = Task.where(request_id: self.id).count
    remaining = request_number - task_count
    if remaining == 0
      message = "定員に達しています"
    else
      message = "あと#{remaining}人"
    end

    return message
  end

  #リクエストの削除とともにtaskも削除する
  def tasks_destroy
    tasks = Task.where(request_id: self.id).destroy_all
  end

  def likes_count
    return Like.where(request_id: self.id).count
  end

end
