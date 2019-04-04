class AddStateAndCityToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :city, foreign_key: true
    add_reference :users, :state, foreign_key: true
  end
end
