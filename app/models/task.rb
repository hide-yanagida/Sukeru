class Task < ApplicationRecord
  validates :user_id, {presence: true}
  validates :request_id, {presence: true}
end
