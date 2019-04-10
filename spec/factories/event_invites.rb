FactoryBot.define do
  factory :event_invite do
    event
    user
    association :invitee, factory: :user

    trait :approved do
      invite_respond {:approved}
    end
  end
end
