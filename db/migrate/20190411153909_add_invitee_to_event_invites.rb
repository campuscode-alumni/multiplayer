class AddInviteeToEventInvites < ActiveRecord::Migration[5.2]
  def change
    add_reference :event_invites, :invitee
  end
end
