require 'rails_helper'

describe 'as an Admin' do
  it 'allows an admin to change a users acive status' do
    admin = User.create(first_name: 'Woodrow', last_name: 'Wilson', email: 'ww1@gmail.com', role: 1, token: 'dasf', refresh_token: 'dasf')
    user = User.create(first_name: 'Jimmy', last_name: 'Carter', email: 'peanut_farmer@gmail.com', role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within "#user-#{user.id}" do
      expect(page).to have_content(user.first_name)
      expect(page).to have_button("Disable this User")
      click_on "Disable this User"
      user.reload
      expect(page).to have_content(user.first_name)
      expect(user.status).to be false
    end
  end

  it 'shows admin an enable button if user status is false' do
    admin = User.create(first_name: 'Woodrow', last_name: 'Wilson', email: 'ww1@gmail.com', role: 1, token: 'dasf', refresh_token: 'dasf')
    user = User.create(first_name: 'Jimmy', last_name: 'Carter', email: 'peanut_farmer@gmail.com', role: 0, status: false)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within "#user-#{user.id}" do
      expect(page).to have_content(user.first_name)
      expect(page).to have_button("Enable this User")
    end
  end
end
# as an admin, when i am logged in and visit /admin/users
# i see all the users in the system
# and there is an enable button by disabled users
# and a disabled button by enabled users.
# child of #25
