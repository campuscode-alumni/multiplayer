FactoryBot.define do
  factory :event_request do
    event
    user
    association :event_owner, factory: :user
  end
end
