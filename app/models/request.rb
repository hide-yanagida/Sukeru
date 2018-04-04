class Request < ApplicationRecord
  validates :title, {presence: true}
  validates :content, {presence: true}
  validates :from_date, {presence: true}
  validates :from_time, {presence: true}
  validates :to_date, {presence: true}
  validates :to_time, {presence: true}
  validates :address, {presence: true}
  validates :reward, {presence: true}
  validates :number, {presence: true}


  def user
    return User.find_by(id: self.user_id)
  end

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

end
