require 'rails_helper'

RSpec.describe 'logging out' do
  context 'as a registered user' do
    it 'can log out' do
      user = User.create(email: 'user@test.com', password: 'test_password')

      visit login_path

      expect(current_path).to eq login_path

      fill_in :email, with: user.email
      fill_in :password, with: user.password

      click_on 'Login'

      expect(current_path).to eq root_path
      click_on 'Log Out'
      expect(current_path).to eq root_path
      expect(page).to have_link('Log In')
      expect(page).to have_link('Sign Up')
    end
  end
end
