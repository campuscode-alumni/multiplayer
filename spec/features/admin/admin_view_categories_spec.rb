require 'rails_helper'

feature 'Admin view Categories' do
  scenario 'successfully' do
    admin = create(:admin)
    rpg = create(:category, name: 'RPG')
    fps = create(:category, name: 'FPS')
    plat = create(:category, name: 'Plataforma')

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Ver Categorias cadastradas'

    expect(current_path).to eq(categories_path)
    expect(page).to have_css('h2', text: 'Multiplayer - Categorias')
    expect(page).to have_link(rpg.name)
    expect(page).to have_link(fps.name)
    expect(page).to have_link(plat.name)
    expect(page).to have_content('Total de Categorias: 3')
    expect(page).to have_link('Voltar')
  end

  scenario 'and returns to home' do
    admin = create(:admin)

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Ver Categorias cadastradas'
    click_on 'Voltar'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Ver Categorias cadastradas')
  end

  scenario 'and clicks on one of them' do
    admin = create(:admin)
    rpg = create(:category, name: 'RPG')

    login_as(admin, scope: :admin)
    visit root_path
    click_on 'Ver Categorias cadastradas'
    click_on rpg.name

    expect(current_path).to eq(category_path(rpg))
    expect(page).to have_css('h2', text: 'Categorias - ' + rpg.name)
    expect(page).to have_link('Editar Categoria')
    expect(page).to have_link('Deletar Categoria')
    expect(page).to have_link('Voltar')
  end
end
