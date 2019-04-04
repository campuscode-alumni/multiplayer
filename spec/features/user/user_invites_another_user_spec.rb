require 'rails_helper'

feature 'User invites another user' do
  scenario 'to an event using email' do
    user = create(:user)
    another_user = create(:user)
    event = create(:event)

    login_as(user, scope: :user)
    visit event_path(event)
    fill_in 'Informe o Email ou Nickname do usuário', with: another_user.email
    click_on 'Convidar'

    expect(page).to have_content("Convite enviado para o usuário #{another_user.nickname}")
    expect(EventInvite.count).to eq(1)
  end

  scenario 'to an event using email' do
    user = create(:user)
    another_user = create(:user)
    event = create(:event)

    login_as(user, scope: :user)
    visit event_path(event)
    fill_in 'Informe o Email ou Nickname do usuário', with: another_user.nickname
    click_on 'Convidar'

    expect(page).to have_content("Convite enviado para o usuário #{another_user.nickname}")
    expect(EventInvite.count).to eq(1)
  end

  scenario 'but informs an email that does not exist' do
    user = create(:user)
    event = create(:event)

    login_as(user, scope: :user)
    visit event_path(event)
    fill_in 'Informe o Email ou Nickname do usuário', with: 'emailquenao@existe.com'
    click_on 'Convidar'

    expect(page).to have_content('Não foi encontrado um usuário com este email')
    expect(EventInvite.count).to eq(0)
  end
end