require 'rails_helper'

feature 'User creates account' do
  scenario 'successfully' do
    visit root_path
    click_on 'Entrar'
    click_on 'Cadastro'
    fill_in 'Nome', with: 'Vini'
    fill_in 'E-mail', with: 'vini@gmail.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmar senha', with: '12345678'
    click_on 'Enviar'

    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
    expect(page).to have_content('Logado como: vini@gmail.com')
  end

  scenario 'and name is mandatory' do
    visit root_path
    click_on 'Entrar'
    click_on 'Cadastro'
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: 'vini@gmail.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmar senha', with: '12345678'
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
  end
end