Given("I am on the new todo page") do
  visit new_todo_path
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I pick the {string} emoji from the allowed list") do |emoji|
  select emoji, from: "Emoji"
end

When("I try to enter {string} as the emoji") do |emoji|
  @attempted_emoji = emoji
end

When("I click {string}") do |label|
  if @attempted_emoji && label == "Create Todo"
    description = find_field("Description").value
    page.driver.post todos_path, { todo: { description: description, emoji: @attempted_emoji } }
    @last_response_body = page.driver.response.body
    @attempted_emoji = nil
  else
    click_on label
  end
end

Then("I should see {string}") do |text|
  page_text = @last_response_body || page.text
  expect(page_text).to include(text)
end

Then("I should see {string} on the page") do |text|
  expect(page).to have_content(text)
end

Then("the todo should not be saved") do
  expect(Todo.find_by(description: "Custom emoji task")).to be_nil
end
