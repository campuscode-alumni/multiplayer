FactoryBot.define do
  factory :admin do
    sequence(:email) { |i| "email#{i}@admin.com" }
    password { Array.new(8) { Random.rand(10) }.join }
  end
end
