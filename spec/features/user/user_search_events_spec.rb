require 'rails_helper'

feature 'User search events' do
  scenario 'successfully' do
    user1 = create(:user)
    user2 = create(:user)
    event = create(:event, user: user2)

    login_as user1, scope: :user
    visit root_path
    click_on 'Encontrar Eventos'
    fill_in 'Procurar por:', with: event.title
    click_on 'Pesquisar'

    expect(current_path).to eq search_events_path
    expect(page).to have_css('h1', text: 'Pesquisar Eventos')
    expect(page).to have_css('p', text: event.title)
    expect(page).to have_content('Foi encontrado 1 evento')
  end

  scenario 'partially' do
    user1 = create(:user)
    user2 = create(:user)
    event = create(:event, title: 'Jogatina', user: user2)

    login_as(user1, scope: :user)
    visit root_path
    click_on 'Encontrar Eventos'
    fill_in 'Procurar por:', with: 'joga'
    click_on 'Pesquisar'

    expect(current_path).to eq search_events_path
    expect(page).to have_css('h1', text: 'Pesquisar Eventos')
    expect(page).to have_css('p', text: event.title)
    expect(page).to have_content('Foi encontrado 1 evento')
  end

  scenario 'and does not find event' do
    user1 = create(:user)
    user2 = create(:user)
    event = create(:event, title: 'Jogatina', user: user2)

    login_as(user1, scope: :user)
    visit root_path
    click_on 'Encontrar Eventos'
    fill_in 'Procurar por:', with: 'batata'
    click_on 'Pesquisar'

    expect(current_path).to eq search_events_path
    expect(page).to have_css('h1', text: 'Pesquisar Eventos')
    expect(page).not_to have_css('p', text: event.title)
    expect(page).to have_content('Nenhum evento encontrado')
  end

  scenario 'and view event' do
    user1 = create(:user)
    user2 = create(:user)
    event = create(:event, user: user2)

    login_as user1, scope: :user
    visit root_path
    click_on 'Encontrar Eventos'
    fill_in 'Procurar por:', with: event.title
    click_on 'Pesquisar'
    click_on event.title

    expect(current_path).to eq event_path(event)
    expect(page).to have_css('h2', text: event.title)
  end
end
