#   Create test database
Given(/the following games exist:/) do |table|
  table.hashes.each do |game|
    Game.create!(:title => game['title'], :genre => game['genre'], :score => game['score'], :developer => game['developer'])
  end
end

Then /I should see "(.*)" before "(.*)"/ do |game1, game2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(game1) < page.body.index(game2))
end


