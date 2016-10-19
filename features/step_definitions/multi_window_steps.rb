Given(/^I switch to a new window$/) do
  window = open_new_window
  switch_to_window(window)
end

Given(/^I switch to window "([^"]*)"$/) do |index|
  switch_to_window(windows[index.to_i - 1])
end

Then(/^I should have "([^"]*)" active windows$/) do |count|
  expect(windows.count).to eq count.to_i
end

Given(/^I am on the quiz page for "([^"]*)" in window "([^"]*)"$/) do |quiz, index|
  quiz = Quiz.find_by(name: quiz)
  switch_to_window(windows[index.to_i - 1])
  visit quiz_path(quiz)
  expect(page).to have_content quiz.name
end

Then(/^I should see "([^"]*)" within window "([^"]*)"$/) do |content, index|
  # switch_to_window(windows[index.to_i - 1])
  # steps %{
  #   Then show me the page
  # }
  expect(page).to have_content content
end