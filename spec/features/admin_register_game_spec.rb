require 'rails_helper'

feature 'Admin register Game' do
  scenario 'successfully' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Cadastrar Novo Jogo'
    fill_in 'Nome', with: 'Dark Souls'
    fill_in 'Ano de Lançamento', with: '2012'
    attach_file 'Foto', Rails.root.join('spec', 'support', 'sega.png')
    click_on 'Enviar'

    expect(page).to have_content('Jogo Dark Souls cadastrado com sucesso')
    expect(page).to have_css('h2', text: 'Cadastrar Novo Jogo')
  end

  scenario 'but name and year are mandatory' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit new_game_path
    fill_in 'Nome', with: ''
    fill_in 'Ano de Lançamento', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Ano de Lançamento não pode ficar em branco')
  end

  scenario 'but year must be a number' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit new_game_path
    fill_in 'Nome', with: 'Bioshock'
    fill_in 'Ano de Lançamento', with: 'abcd'
    click_on 'Enviar'

    expect(page).to have_content('Ano de Lançamento não é um número')
  end

  scenario 'but do not see button if not authenticated' do
    visit root_path

    expect(page).not_to have_content('Cadastrar Novo Jogo')
  end

  scenario 'but only if authenticated' do
    visit new_game_path

    expect(current_path).to eq new_admin_session_path
  end

  scenario 'but gives up and return to home' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit new_game_path
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
