require 'rails_helper'

describe 'Admin' do

  it 'restricts paths to non admin' do
      visit '/admin/dashboard'
      expect(page.status_code).to eq(404)
  end

  it 'shows list of users on dashboard' do
    admin = User.create(first_name: 'Woodrow', last_name: 'Wilson', email: 'ww1@gmail.com', role: 1, token: 'dasf', refresh_token: 'dasf')
    user = User.create(first_name: 'Jimmy', last_name: 'Carter', email: 'peanut_farmer@gmail.com', role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/dashboard'

    expect(page).to have_content('List of All Users')
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.role)
  end
end
