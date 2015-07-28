require_relative '../test_helper'

class UserCreatesAccountTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'user can create account' do
    visit new_user_path
    fill_in "Username", with: "rachel"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, rachel")
  end


  #
  # def test_registered_user_can_login
  #   User.destroy_all
  #   # visit new_user_path
  #   # fill_in "Username", with: "rachel"
  #   # fill_in "Password", with: "password"
  #   # click_button "Create Account"
  #   # click_link "Logout"
  #
  #   User.create(username: "rachel", password: "password")
  #   visit login_path
  #   fill_in "Username", with: "rachel"
  #   fill_in "Password", with: "password"
  #   click_button "Login"
  #   within(".flash_notice") do
  #     assert page.has_content?("Welcome, rachel")
  #   end
  #
  #   visit root_path
  #   assert page.has_content?("Logged in as rachel")
  # end

end