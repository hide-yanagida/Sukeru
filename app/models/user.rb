class User < ApplicationRecord
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password, {presence: true}

  has_secure_password

  def requests
    return Request.where(user_id: self.id)
  end

end
