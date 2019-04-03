FactoryBot.define do
  factory :user do
    sequence(:name) { |i| "User #{i}" }
    sequence(:email) { |i| "admin#{i}@gmail.com" }
    sequence(:nickname) { |i| "Userino #{i}" }
    password { '123456' }
  end
end
