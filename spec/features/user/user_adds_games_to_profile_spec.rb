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
end
