class Request < ApplicationRecord
  validates :title, {presence: true}
  validates :content, {presence: true}
  validates :from_date, {presence: true}
  validates :from_time, {presence: true}
  validates :to_date, {presence: true}
  validates :to_time, {presence: true}
  validates :address, {presence: true}
  validates :reward, {presence: true}


  def user
    return User.find_by(id: self.user_id)
  end

end
