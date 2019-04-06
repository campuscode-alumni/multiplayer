require 'rails_helper'

feature 'User invites another user' do
  q = 'Informe o Email ou Nickname do usuário'

  scenario 'to an event using email' do
    user = create(:user)
    another_user = create(:user)
    event = create(:event)

    login_as(user, scope: :user)
    visit event_path(event)
    fill_in q, with: another_user.email
    click_on 'Convidar'

    expect(page).to have_content(convite_enviado(another_user))
    expect(EventInvite.count).to eq(1)
  end

  scenario 'to an event using email' do
    user = create(:user)
    another_user = create(:user)
    event = create(:event)

    login_as(user, scope: :user)
    visit event_path(event)
    fill_in q, with: another_user.nickname
    click_on 'Convidar'

    expect(page).to have_content(convite_enviado(another_user))
    expect(EventInvite.count).to eq(1)
  end

  scenario 'but informs an email that does not exist' do
    user = create(:user)
    event = create(:event)

    login_as(user, scope: :user)
    visit event_path(event)
    fill_in q, with: 'emailquenao@existe.com'
    click_on 'Convidar'

    expect(page).to have_content('Não foi encontrado um usuário com este email')
    expect(EventInvite.count).to eq(0)
  end

  def convite_enviado(user)
    "Convite enviado para o usuário #{user.nickname}"
  end
end
