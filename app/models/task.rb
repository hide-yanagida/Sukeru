class Task < ApplicationRecord
  validates :user_id, {presence: true}
  validates :request_id, {presence: true}

  def count
    return Request.find_by(id: self.request_id).number
  end
end
