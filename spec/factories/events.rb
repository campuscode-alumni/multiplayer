FactoryBot.define do
  factory :event do
    title { "MyString" }
    user { nil }
    game_platform { nil }
    description { "MyText" }
    event_date { "2019-04-02" }
    user_limit { 1 }
    event_type { 1 }
    event_location { "MyString" }
  end
end
