FactoryBot.define do
  factory :user do
    nickname { 'test_user' }
    email { 'test1@example.com' }
    admin { 'false' }
    password { 'password' }
  end
end
