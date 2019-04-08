require 'rails_helper'

feature 'User adds games to profile' do
  scenario 'from game page' do
    user = create(:user)
    game = create(:game)

    login_as(user, scope: :user)
    visit game_path(game)
    click_on 'Adicionar ao meu Perfil'

    expect(current_path).to eq(game_path(game))
    expect(page).to have_content('Este jogo foi vinculado ao seu perfil')
    expect(page).not_to have_link('Adicionar ao meu Perfil')
    expect(GameUser.count).to eq(1)
  end

  scenario 'and checks game listed' do
    user = create(:user)
    game = create(:game)

    login_as(user, scope: :user)
    visit game_path(game)
    click_on 'Adicionar ao meu Perfil'
    visit user_path(user)

    expect(page).to have_css('h3', text: 'Meus Jogos')
    expect(page).to have_link(game.name)
  end

  scenario 'from home page timeline' do
    user = create(:user)
    game = create(:game)
    another_game = create(:game)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Adicionar ao meu Perfil', match: :first
    visit user_path(user)

    expect(page).to have_link(game.name)
    expect(page).not_to have_link(another_game.name)
  end

  scenario 'until all games from timeline are added' do
    user = create(:user)
    create(:game)
    create(:game)
    create(:game)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Adicionar ao meu Perfil', match: :first
    visit root_path
    click_on 'Adicionar ao meu Perfil', match: :first
    visit root_path
    click_on 'Adicionar ao meu Perfil'
    visit root_path

    expect(page).not_to have_link('Adicionar ao meu Perfil')
    expect(GameUser.count).to eq(3)
  end

  scenario 'from game search' do
    user = create(:user)
    game = create(:game)
    another_game = create(:game)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Encontrar Jogos'
    fill_in 'Procurar por:', with: another_game.name
    click_on 'Pesquisar'
    click_on 'Adicionar ao meu Perfil', match: :first
    visit user_path(user)

    expect(page).not_to have_link(game.name)
    expect(page).to have_link(another_game.name)
  end

  scenario 'only if game is not already added' do
    user = create(:user)
    game = create(:game)
    create(:game_user, game: game, user: user)

    login_as(user, scope: :user)
    visit game_path(game)
    expect(page).not_to have_link('Adicionar ao meu Perfil')
  end

  scenario 'from timeline only if game is not already added' do
    user = create(:user)
    game = create(:game)
    create(:game)
    create(:game_user, game: game, user: user)

    login_as(user, scope: :user)
    visit root_path

    expect(page).to have_link('Adicionar ao meu Perfil', count: 1)
  end

  scenario 'from game search only if game is not already added' do
    user = create(:user)
    game = create(:game)
    create(:game_user, game: game, user: user)

    login_as(user, scope: :user)
    visit root_path
    click_on 'Encontrar Jogos'
    fill_in 'Procurar por:', with: game.name
    click_on 'Pesquisar'

    expect(page).not_to have_link('Adicionar ao meu Perfil')
  end
end
