FactoryBot.define do
  factory :user do
    sequence(:name) { |i| "User #{i}" }
    sequence(:email) { |i| "user#{i}@email.com" }
    password { Array.new(8) { Random.rand(10) }.join }
    sequence(:nickname) { |i| "Userino #{i}" }
    city
    state
  end
end
