FactoryBot.define do
  factory :user do
    name { 'user' }
    sequence(:email) { |i| "user#{i}@email.com" }
    password { Array.new(8) { Random.rand(10) }.join }
  end
end
