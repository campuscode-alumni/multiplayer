require 'rails_helper'

feature 'User edit Profile' do
  scenario 'successfully' do
    user = create(:user)
    state = create(:state, name: 'SP')
    create(:city, name: 'São Paulo', state: state)
    
    login_as(user, scope: :user)
    visit root_path
    click_on 'Editar Perfil'
    fill_in 'Nickname', with: 'Serjao00'
    select 'SP', from: 'Estado'
    select 'São Paulo', from: 'Cidade'
    attach_file 'Avatar', Rails.root.join('spec', 'support', 'sega.png')
    click_on 'Atualizar'

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content('Perfil atualizado com sucesso')
    expect(page).to have_css('h2', text: 'Serjao00')
    expect(page).to have_css('img[src*="sega.png"]')
    expect(page).to have_content('SP')
    expect(page).to have_content('São Paulo')
  end

  scenario 'and selects state and city' do
    user = create(:user)
    state = create(:state, name: 'SP')
    create(:city, name: 'São Paulo', state: state)
    
    login_as(user, scope: :user)
    visit root_path
    click_on 'Editar Perfil'
    fill_in 'Nickname', with: 'Serjao00'
    select 'SP', from: 'Estado'
    select 'São Paulo', from: 'Cidade'
    attach_file 'Avatar', Rails.root.join('spec', 'support', 'sega.png')
    click_on 'Atualizar'

    expect(page).to have_content('SP')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('Perfil atualizado com sucesso!')
  end

  scenario 'and nickname is mandatory' do
    user = create(:user, nickname: 'vinao')
    state = create(:state, name: 'SP')
    create(:city, name: 'São Paulo', state: state)
    
    login_as(user, scope: :user)
    visit root_path
    click_on 'Editar Perfil'
    fill_in 'Nickname', with: user.nickname
    select 'SP', from: 'Estado'
    select 'São Paulo', from: 'Cidade'
    attach_file 'Avatar', Rails.root.join('spec', 'support', 'sega.png')
    click_on 'Atualizar'

    expect(page).to have_content('Nickname não pode ficar em branco')
  end
end