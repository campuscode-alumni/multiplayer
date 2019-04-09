FactoryBot.define do
  factory :event do
    sequence(:title) { |i| "Evento #{i}" }
    user
    game_platform
    description { 'MyText' }
    event_date { Time.zone.now + 3.days }
    user_limit { 1 }
    event_type { 1 }
    event_location { 'MyString' }
  end
end
