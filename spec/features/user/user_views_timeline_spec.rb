require 'rails_helper'

feature 'User views timeline' do
  scenario 'and sees search links' do
    user = create(:user)

    login_as(user, scope: :user)
    visit root_path

    expect(page).to have_link('Encontrar Eventos')
    expect(page).to have_link('Encontrar Jogos')
    expect(page).to have_link('Encontrar Usuários')
  end

  scenario 'and sees latest 5 games' do
    user = create(:user)
    sonic_mania = create(:game, name: 'Sonic Mania')
    mario_odyssey = create(:game, name: 'Super Mario Odyssey')
    sekiro = create(:game, name: 'Sekiro')
    forza = create(:game, name: 'Forza Horizon 4')
    gow = create(:game, name: 'God of War')
    aco = create(:game, name: 'Assassin\'s Creed Odyssey')

    login_as(user, scope: :user)
    visit root_path

    expect(page).to have_css('h3', text: 'Últimos Jogos adicionados')
    expect(page).to have_link(mario_odyssey.name)
    expect(page).to have_link(sekiro.name)
    expect(page).to have_link(forza.name)
    expect(page).to have_link(gow.name)
    expect(page).to have_link(aco.name)
    expect(page).not_to have_link(sonic_mania.name)
  end

  scenario 'and see latest 5 events that are yet to occur' do
    user = create(:user)
    today = Time.zone.today
    jogatina = create(
      :event, title: 'Jogatina Top', event_date: today + 3.days
    )
    super_jogatina = create(
      :event, title: 'Super Jogatina', event_date: today + 4.days
    )
    noite_play2 = create(
      :event, title: 'Noite do Playstation 2', event_date: today
    )
    tarde_ds = create(
      :event, title: 'Tarde do Nintendo DS', event_date: today + 2.days
    )
    tarde_gba = create(
      :event, title: 'Tarde do Game Boy Advance', event_date: today - 2.days
    )
    manha_dc = create(
      :event, title: 'Manhã do Dreamcast', event_date: today + 3.days
    )
    bf_play = create(
      :event, title: 'Battlefield da turma da facul', event_date: today + 8.days
    )
    sprun_night = create(
      :event, title: 'Noite do Speedrun', event_date: today - 4.days
    )

    login_as(user, scope: :user)
    visit root_path

    expect(page).to have_css('h3', text: 'Próximos Eventos')
    expect(page).not_to have_link(jogatina.title)
    expect(page).to have_link(super_jogatina.title)
    expect(page).to have_link(noite_play2.title)
    expect(page).to have_link(tarde_ds.title)
    expect(page).not_to have_link(tarde_gba.title)
    expect(page).to have_link(manha_dc.title)
    expect(page).to have_link(bf_play.title)
    expect(page).not_to have_link(sprun_night.title)
  end

  scenario 'and see latest events with creators names' do
    user = create(:user)
    nint_event = create(:event)
    sony_event = create(:event)
    micro_event = create(:event)

    login_as(user, scope: :user)
    visit root_path

    expect(page).to have_css('h3', text: 'Próximos Eventos')
    expect(page).to have_content("Criado por: #{nint_event.user.nickname}")
    expect(page).to have_content("Criado por: #{sony_event.user.nickname}")
    expect(page).to have_content("Criado por: #{micro_event.user.nickname}")
  end

  scenario 'and see latest with info about attendance' do
    user = create(:user)
    event = create(:event, user_limit: 4)
    create(:event_participation, event: event)
    create(:event_participation, event: event)
    create(:event_participation, event: event)
    create(:event_participation, event: event)

    login_as(user, scope: :user)
    visit root_path
    save_page
    expect(page).to have_link(event.title)
    expect(page).to have_css('img[src*="full_attendance.png"]')
    expect(page).to have_css('img[title*="Todas as vagas estão preenchidas"]')
  end
end
