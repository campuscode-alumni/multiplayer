class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.references :game_platform, foreign_key: true
      t.text :description
      t.date :event_date
      t.integer :user_limit
      t.integer :event_type
      t.string :event_location

      t.timestamps
    end
  end
end
