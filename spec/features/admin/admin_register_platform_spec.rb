require 'rails_helper'

feature 'Admin register platform' do
  scenario 'successfully' do
    admin = create(:admin)
    create(:company, name: 'Sony')

    login_as admin, scope: :admin
    visit root_path
    click_on 'Cadastrar Plataforma'
    select 'Sony', from: 'Empresa'
    fill_in 'Nome', with: 'PS4'
    attach_file 'Logo', Rails.root.join('spec', 'support', 'ps4.png')
    click_on 'Enviar'

    expect(page).to have_content('Plataforma PS4 criada com sucesso!')
    expect(page).not_to have_css('h2', text: 'Cadastrar Plataforma')
  end

  scenario 'but name cannot be blank' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit root_path
    click_on 'Cadastrar Plataforma'
    fill_in 'Nome', with: ''
    attach_file 'Logo', Rails.root.join('spec', 'support', 'ps4.png')
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_css('h2', text: 'Cadastrar Plataforma')
  end

  scenario 'but name cannot be repeated' do
    admin = create(:admin)
    platform = create(:platform)

    login_as admin, scope: :admin
    visit root_path
    click_on 'Cadastrar Plataforma'
    fill_in 'Nome', with: platform.name
    attach_file 'Logo', Rails.root.join('spec', 'support', 'ps4.png')
    click_on 'Enviar'

    expect(page).to have_content('Nome já está em uso')
    expect(page).to have_css('h2', text: 'Cadastrar Plataforma')
  end

  scenario 'but logo cannot be empty' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit root_path
    click_on 'Cadastrar Plataforma'
    fill_in 'Nome', with: 'Sony'
    click_on 'Enviar'

    expect(page).to have_content('Logo precisa ser enviado')
    expect(page).to have_css('h2', text: 'Cadastrar Plataforma')
  end

  scenario 'but do not see button if not authenticated' do
    visit root_path

    expect(page).not_to have_content('Cadastrar Platforma')
  end

  scenario 'but only if authenticated' do
    visit new_platform_path

    expect(current_path).to eq new_admin_session_path
  end

  scenario 'but gives up and return to home' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit new_platform_path
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
