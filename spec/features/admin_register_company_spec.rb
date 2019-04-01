require 'rails_helper'

feature 'Admin register company' do
  scenario 'successfully' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Cadastrar Empresa Fabricante'
    fill_in 'Nome', with: 'Sega'
    attach_file 'Logo', Rails.root.join('spec', 'support', 'sega.png')
    click_on 'Enviar'

    expect(page).to have_content('Empresa Sega cadastrada com sucesso')
  end

  scenario 'but name is required' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Cadastrar Empresa Fabricante'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
  end

  scenario 'but name cannot be repeated' do
    admin = create(:admin)
    company = create(:company)

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Cadastrar Empresa Fabricante'
    fill_in 'Nome', with: company.name
    click_on 'Enviar'

    expect(page).to have_content('Nome já está em uso')
  end

  scenario 'but logo cannot be empty' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Cadastrar Empresa Fabricante'
    fill_in 'Nome', with: 'Nintendo'
    click_on 'Enviar'

    expect(page).to have_content('Logo precisa ser enviado')
  end
end