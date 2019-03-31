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

  scenario 'and name is mandatory' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit new_game_category_path
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
  end

  scenario 'and name is at use' do
    create(:game_category, name: 'Tiro')
    admin = create(:admin)

    login_as admin, scope: :admin
    visit new_game_category_path
    fill_in 'Nome', with: 'Tiro'
    click_on 'Enviar'

    expect(page).to have_content('Nome já está em uso')
  end

  scenario 'and only logged admin can see button' do
    visit root_path

    expect(page).not_to have_content('Cadastrar Categoria de Jogo')
  end

  scenario 'and only logged admin can register game category' do
    visit new_game_category_path

    expect(current_path).to eq new_admin_session_path
  end

  scenario 'and should have return button' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit new_game_category_path

    expect(page).to have_link('Voltar')
  end

  scenario 'and return button should go to root_path' do
    admin = create(:admin)

    login_as admin, scope: :admin
    visit new_game_category_path
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
