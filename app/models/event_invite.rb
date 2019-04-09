class EventInvite < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :invitee, class_name: 'User', inverse_of: :received_invites
end
