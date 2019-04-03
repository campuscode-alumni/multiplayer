class RemoveUserFromCity < ActiveRecord::Migration[5.2]
  def change
    remove_reference :cities, :user, foreign_key: true
  end
end
