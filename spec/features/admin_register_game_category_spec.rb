require 'rails_helper'

feature 'Admin register game category' do
  scenario 'successfully' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit root_path
    click_on 'Cadastrar Categoria de Jogo'
    fill_in 'Nome', with: 'Tiro'
    click_on 'Enviar'

    expect(page).to have_content('Categoria Tiro cadastrada com sucesso!')
  end

  scenario 'and only logged admin can see button' do
    visit root_path

    expect(page).not_to have_content('Cadastrar Categoria de Jogo')
  end
end
