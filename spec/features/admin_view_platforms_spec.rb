require 'rails_helper'

feature 'Admin view platform' do
  scenario 'successfully' do
    admin = create(:admin)
    xbox = create(:platform, name: 'xbox')
    playstation = create(:platform, name: 'playstation')
    ds = create(:platform, name: 'ds')

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Ver Consoles Cadastrados'

    expect(current_path).to eq(platforms_path)
    expect(page).to have_css('h2', text: 'Multiplayer - Consoles')
    expect(page).to have_link(xbox.name)
    expect(page).to have_link(playstation.name)
    expect(page).to have_link(ds.name)
    expect(page).to have_content('Total de Consoles: 3')
    expect(page).to have_link('Voltar')
  end

  scenario 'and returns to home' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Ver Consoles Cadastrados'
    click_on 'Voltar'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Ver Consoles Cadastrados')
  end

  scenario 'and clicks on one of them' do
    admin = create(:admin)
    xbox = create(:platform, name: 'xbox')

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Ver Consoles Cadastrados'
    click_on xbox.name

    expect(current_path).to eq(platform_path(xbox))
    expect(page).to have_css('h2', text: 'Consoles - ' + xbox.name)
    expect(page).to have_link('Editar Console')
    expect(page).to have_link('Deletar Console')
    expect(page).to have_link('Voltar')
  end
end
