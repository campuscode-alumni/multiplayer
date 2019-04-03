class RemoveUserFromState < ActiveRecord::Migration[5.2]
  def change
    remove_reference :states, :user, foreign_key: true
  end
end
