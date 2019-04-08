require 'rails_helper'

feature 'User search games' do
  scenario 'from home page' do
    user = create(:user)
    mt = create(:game, name: 'Mario Tennis Aces')
    mg = create(:game, name: 'Mario Golf 64')
    mk = create(:game, name: 'Mario Kart Super Circuit')
    sf = create(:game, name: 'Street Fighter 3')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Encontrar Jogos'
    fill_in 'Procurar por:', with: 'Mario'
    click_on 'Pesquisar'

    expect(page).to have_css('h1', text: 'Pesquisar Jogos')
    expect(page).to have_link(mt.name)
    expect(page).to have_link(mg.name)
    expect(page).to have_link(mk.name)
    expect(page).not_to have_link(sf.name)
    expect(page).to have_content('Foram encontrados 3 Jogos')
  end
end