class AddInviteRespondToEventInvite < ActiveRecord::Migration[5.2]
  def change
    add_column :event_invites, :invite_respond, :integer
  end
end
