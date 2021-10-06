FactoryBot.define do
  factory :question do
    title { 'test_user' }
    question_body { 'test1@example.com' }
    solved { 'false' }
    user
  end
end
