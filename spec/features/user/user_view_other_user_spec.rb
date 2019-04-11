require 'rails_helper'

feature 'User View users profiles' do

  scenario 'view own profile' do
    user = create(:user)
    
    login_as(user, scope: :user)

    visit user_path(user)
  
    expect(page).not_to have_css('div', id:'invite_to_event')
    
  end

  scenario 'does not view profiles if not signed in' do
    user = create(:user)

    visit user_path(user)
  
    expect(current_path).to eq new_user_session_path
    
  end
end