class RemoveInviteeFromEventInvites < ActiveRecord::Migration[5.2]
  def change
    remove_reference :event_invites, :invitee, foreign_key: true
  end
end
