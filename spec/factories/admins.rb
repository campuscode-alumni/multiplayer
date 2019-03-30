FactoryBot.define do
  factory :admin do
    sequence(:email) {|i| "email#{i}@admin.com"}
    password { 8.times.map { Random.rand(10) }.join }
  end
end