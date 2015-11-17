Given(/^There is an ApiKey$/) do
  ApiKey.create!
end
Given(/^There is already a user$/) do
  @user = FactoryGirl.create(:user)
end

Given(/^A todo item$/) do
  @todo = FactoryGirl.create(:todo)
end

Given(/^I'm not signed in$/) do
  visit('/users/sign_out')
end

When(/^I visit home page$/) do
  visit('/')
end

Then(/^I fill in login information$/) do
  fill_in "user_email", :with => "user@example.com"
  fill_in "user_password", :with => "password"
  click_button "Log in"
end

Then(/^I should see 'Todo item (\d+)'$/) do |arg1|
  page.should have_content("Todo item 1")
end
