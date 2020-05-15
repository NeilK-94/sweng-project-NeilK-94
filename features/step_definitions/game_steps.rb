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

When /I (un)?check the following genres: (.*)/ do |uncheck, genre_list|
  genre_list.split(', ').each do |genre|
    step %{I #{uncheck.nil? ? '' : 'un'}check "genres_#{genre}"}
  end
end

Then /I should see all the games/ do
  # Make sure that all the games in the app are visible in the table
  Game.all.each do |game|
    step %{I should see "#{game.title}"}
  end
end

Then /I should see no games/ do
  # Make sure that all the games in the app are visible in the table
  Game.all.each do |game|
    step %{I should not see "#{game.title}"}
  end
end

