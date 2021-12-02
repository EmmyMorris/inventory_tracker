require 'rails_helper'

RSpec.describe 'log in' do
  it 'can log in with valid credentials' do
    user = User.create(email: 'user@test.com', password: 'test_password')

    visit root_path
    click_on 'Log In'
    expect(current_path).to eq login_path

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on 'Login'

    expect(current_path).to eq root_path
    expect(page).to have_content "Welcome"
    expect(page).to have_content "Logged in as #{user.email}."
  end

  it 'cannot log in with bad credentials' do
    user = User.create(email: 'user@test.com', password: 'test_password')
    visit login_path

    fill_in :email, with: user.email
    fill_in :password, with: 'incorrect password'
    click_on 'Login'

    expect(current_path).to eq "/sessions"
    expect(page).to have_content 'Email or password is invalid'
  end
end
