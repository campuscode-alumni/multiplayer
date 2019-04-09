require 'rails_helper'

feature 'User view invites' do
  scenario 'successfully' do
    user = create(:user)
    event1 = create(:event)
    event2 = create(:event)
    create(:event_invite, invitee: user, event: event1)
    create(:event_invite, invitee: user, event: event2)

    login_as user, scope: :user
    visit root_path
    click_on 'Ver convites recebidos'

    expect(page).to have_css('h1', text: 'Meus Convites')
    expect(page).to have_link(event1.title)
    expect(page).to have_link(event2.title)
    expect(page).to have_link('Aceitar', count: 2)
    expect(page).to have_link('Recusar', count: 2)
    expect(page).to have_content('Você tem 2 convites de eventos')
  end
end
