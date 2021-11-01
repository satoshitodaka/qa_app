class Question < ApplicationRecord
  validates :title, presence: true
  validates :question_body, presence: true

  belongs_to :user
  has_many :answers

  scope :recent, -> { order(created_at: :desc)}

  def close_question
    update(solved: true, solved_at: Time.zone.now)
  end
  
  private
    def self.ransackble_attributes(auth_object = nil)
      %w[title question_body created_at]
    end

    def self.ransackble_associations(auth_object = nil)
      []
    end
    
end
