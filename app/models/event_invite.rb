class EventInvite < ApplicationRecord
  enum invite_respond: %i[approved declined]

  belongs_to :event
  belongs_to :user, inverse_of: :sent_invites
  belongs_to :invitee, class_name: 'User', inverse_of: :received_invites
end
