require 'rails_helper'

feature 'Admin Authenticate' do
  scenario 'successfully' do
    admin = create(:admin)

    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Senha', with: admin.password
    within 'form' do
      click_on 'Login'
    end

    expect(page).not_to have_link('Login')
    expect(page).to have_link('Sair')
    expect(page).to have_content("Logado como: #{admin.email}")
    expect(page).to have_css('img[src*="admin_star.png"]')
    expect(page).to have_css('img[title*="Logado como Admin"]')
  end

  scenario 'and logs out' do
    admin = create(:admin)

    visit new_admin_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Senha', with: admin.password
    within 'form' do
      click_on 'Login'
    end
    click_on 'Sair'

    expect(page).not_to have_link('Sair')
    expect(page).not_to have_content("Logado como: #{admin.email}")
    expect(page).not_to have_css('img[src*="admin_star.png"]')
    expect(page).not_to have_css('img[title*="Logado como Admin"]')
  end
end
