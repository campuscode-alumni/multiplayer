FactoryBot.define do
  factory :event_invite do
    event
    user
    association :invitee, factory: :user
  end
end
