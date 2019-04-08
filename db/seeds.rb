# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if (!Admin.where(email: 'admin@admin.com').first)
  Admin.create(email: 'admin@admin.com', password: '12345678')
end

if (!User.find_by(email: 'user@user.com'))
  FactoryBot.create(:user, name: 'user', email: 'user@user.com', password: '123456')
end

if (!City.find_by(name: 'São Paulo'))
  state = State.find_by(name: 'SP')
  if state.nil?
    state = FactoryBot.create(:state, name: 'SP')
  end
  FactoryBot.create(:city, name: 'São Paulo', state: state)
end