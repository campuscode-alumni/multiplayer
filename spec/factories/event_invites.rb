FactoryBot.define do
  factory :event_invite do
    event
    user
    invitee
  end
end
