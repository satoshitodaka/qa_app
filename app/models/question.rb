class Question < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true


  def close_question
    self.update(solved: true, solved_at: Time.zone.now)
  end
    private
    
end
