class AddEventOwnerToEventRequest < ActiveRecord::Migration[5.2]
  def change
    add_reference :event_requests, :event_owner
  end
end
