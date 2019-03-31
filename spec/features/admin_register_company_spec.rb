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
end