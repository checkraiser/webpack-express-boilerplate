Given(/^I login successfully$/) do
  step  "There is already a user"
  step  "A todo item"
  step "I'm not signed in"
  step "I visit home page"
  step "I fill in login information"
end

When(/^I fill in the textbox 'Hello World'$/) do
  fill_in "new_todo_input", :with => 'Hello World'
end
When(/^I click 'Add' button$/) do
  click_button 'Add'
  sleep 3
end
Then(/^I could see 'Hello World'$/) do
  page.should have_content 'Hello World'
end
