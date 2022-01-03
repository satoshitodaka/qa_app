class Question < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :answers, dependent: :destroy

  scope :recent, -> { order(created_at: :desc)}

  def close
    update(solved: true)
  end
  
  private
    def self.ransackble_attributes(auth_object = nil)
      %w[title body created_at]
    end

    def self.ransackble_associations(auth_object = nil)
      []
    end
    
end
