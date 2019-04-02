class AddCompanyToPlatform < ActiveRecord::Migration[5.2]
  def change
    add_reference :platforms, :companies, foreign_key: true
  end
end
