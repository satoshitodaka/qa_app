class Question < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :answers

  def close_question
    self.update(solved: true, solved_at: Time.zone.now)
  end
    private
    
end
