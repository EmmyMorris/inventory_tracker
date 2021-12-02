require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  before(:each) do
    @user = User.create(email: 'user@test.com', password: 'test_password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe "GET /new" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end

    it "logs in user" do
      visit "/login"
      fill_in "Email", with: 'user@test.com'
      fill_in "Password", with: 'test_password'
      click_on "Login"
      expect(page).to have_content("Logged in as user@test.com.")
    end

    it "does not log in user" do
      visit "/login"
      fill_in "Email", with: 'user@test.com'
      fill_in "Password", with: 'bad_password'
      click_on "Login"
      expect(page).to have_content("Email or password is invalid")
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      delete "/logout"
      expect(response).to have_http_status(302)
    end
  end
end
