class CreateCategoryGames < ActiveRecord::Migration[5.2]
  def change
    create_table :category_games do |t|
      t.references :category, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
