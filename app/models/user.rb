class User < ApplicationRecord
  has_secure_password
  validates :nickname, presence: true
  validates :email, presence: true

  has_many :questions
  has_many :answers

  has_one_attached :avatar

  before_create :default_image

  def default_image
    if !self.avatar.attached?
      avatar.attach(io: File.open('app/assets/images/user_icon.jpg'), filename: 'user_icon.jpg', content_type: 'image/jpeg')
    end
  end

end
