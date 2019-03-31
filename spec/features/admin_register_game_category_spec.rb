require 'rails_helper'

feature 'Admin register game category' do
  scenario 'successfully' do
    create(:admin)

    visit root_path
    click_on 'Cadastrar Categoria de Jogo'
    fill_in 'Nome', with: 'Tiro'
    click_on 'Enviar'

    expect(page).to have_content('Categoria Tiro cadastrada com sucesso!')
  end
end
