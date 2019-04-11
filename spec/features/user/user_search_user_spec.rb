require 'rails_helper'

feature 'User search user' do
  scenario 'by email' do
    user1 = create(:user)
    user2 = create(:user)

    login_as(user1, scope: :user)
    visit root_path
    click_on 'Encontrar Usuários'
    fill_in 'Procurar por:', with: user2.email
    click_on 'Pesquisar'

    expect(current_path).to eq search_users_path
    expect(page).to have_css('h1', text: 'Pesquisar Usuários')
    expect(page).to have_css('p', text: user2.email)
    expect(page).to have_content('Foi encontrado 1 usuário')
  end

  scenario 'by email partially' do
    user1 = create(:user)
    user2 = create(:user, email: 'vini@gmail.com')
    user3 = create(:user, email: 'vini@uol.com')

    login_as(user1, scope: :user)
    visit root_path
    click_on 'Encontrar Usuários'
    fill_in 'Procurar por:', with: 'vini'
    click_on 'Pesquisar'

    expect(current_path).to eq search_users_path
    expect(page).to have_css('h1', text: 'Pesquisar Usuários')
    expect(page).to have_css('p', text: user2.email)
    expect(page).to have_css('p', text: user3.email)
    expect(page).to have_content('Foram encontrados 2 usuários')
  end

  scenario 'by email and does not find user' do
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Encontrar Usuários'
    fill_in 'Procurar por:', with: 'vini@gmail.com'
    click_on 'Pesquisar'

    expect(current_path).to eq search_users_path
    expect(page).to have_css('h1', text: 'Pesquisar Usuários')
    expect(page).not_to have_link('vini@gmail.com')
    expect(page).to have_content('Nenhum usuário encontrado')
  end

  scenario 'by nickname' do
    user1 = create(:user)
    user2 = create(:user, nickname: 'userino00')

    login_as(user1, scope: :user)
    visit root_path
    click_on 'Encontrar Usuários'
    fill_in 'Procurar por:', with: user2.nickname
    click_on 'Pesquisar'

    expect(current_path).to eq search_users_path
    expect(page).to have_css('h1', text: 'Pesquisar Usuários')
    expect(page).to have_css('p', text: user2.nickname)
    expect(page).to have_link('Ver Perfil')
    expect(page).to have_content('Foi encontrado 1 usuário')
  end

  scenario 'and view profile' do
    user1 = create(:user)
    user2 = create(:user, nickname: 'userino00')

    login_as(user1, scope: :user)
    visit root_path
    click_on 'Encontrar Usuários'
    fill_in 'Procurar por:', with: user2.nickname
    click_on 'Pesquisar'
    click_on 'Ver Perfil'

    expect(current_path).to eq user_path(user2)
    expect(page).to have_css('h2', text: 'Perfil')
    expect(page).to have_content(user2.nickname)
  end
end
