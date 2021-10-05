class User < ApplicationRecord
  has_secure_password
  validates :nickname, presence: true
  validates :email, presence: true

  has_many :questions
  has_many :answers

end
