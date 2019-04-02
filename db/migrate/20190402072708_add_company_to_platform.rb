class AddCompanyToPlatform < ActiveRecord::Migration[5.2]
  def change
    add_reference :platforms, :company, foreign_key: true
  end
end
