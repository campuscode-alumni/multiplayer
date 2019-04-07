require 'rails_helper'

feature 'User views timeline' do
  scenario 'and sees search links' do
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path

    expect(page).to have_link('Encontrar Eventos')
    expect(page).to have_link('Encontrar Jogos')
    expect(page).to have_link('Encontrar Usuários')
  end

  scenario 'and sees latest games' do
    user = create(:user)
    mario_odyssey = create(:game, name: 'Super Mario Odyssey')
    sekiro = create(:game, name: 'Sekiro')
    forza = create(:game, name: 'Forza Horizon 4')

    login_as(user, scope: :user)
    visit root_path

    expect(page).to have_css('h3', text: 'Últimos Jogos adicionados')
    expect(page).to have_link(mario_odyssey.name)
    expect(page).to have_link(sekiro.name)
    expect(page).to have_link(forza.name)
  end
end
