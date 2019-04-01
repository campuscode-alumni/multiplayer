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
    expect(page).not_to have_css('h2', text: 'Cadastrar Empresa Fabricante')
  end

  scenario 'but name is required' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Cadastrar Empresa Fabricante'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_css('h2', text: 'Cadastrar Empresa Fabricante')
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
    expect(page).to have_css('h2', text: 'Cadastrar Empresa Fabricante')
  end
  
  scenario 'but logo cannot be empty' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Cadastrar Empresa Fabricante'
    fill_in 'Nome', with: 'Nintendo'
    click_on 'Enviar'

    expect(page).to have_content('Logo precisa ser enviado')
    expect(page).to have_css('h2', text: 'Cadastrar Empresa Fabricante')
  end
  
  scenario 'but do not see button if not authenticated' do
    visit root_path

    expect(page).not_to have_content('Cadastrar Empresa Fabricante')
  end
  
  scenario 'but only if authenticated' do
    visit new_company_path

    expect(current_path).to eq new_admin_session_path
  end
  
  scenario 'but gives up and return to home' do
    admin = create(:admin)
    
    login_as(admin, scope: :admin)
    visit new_company_path
    click_on 'Voltar'
    
    expect(current_path).to eq root_path
  end
end