class RenameGameCategoryToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_table :game_categories, :categories
  end
end
