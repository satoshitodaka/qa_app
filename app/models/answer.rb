class Answer < ApplicationRecord
  validates :answer_body, presence: true

  belongs_to :user
  belongs_to :question
end
