FactoryBot.define do
  factory :question do
    title { 'test_user' }
    content { 'test1@example.com' }
    solved { 'false' }
    user
  end
end
