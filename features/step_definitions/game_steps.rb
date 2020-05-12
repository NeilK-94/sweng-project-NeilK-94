#   Create test database
Given("the following games exist:") do |table|
  table.hashes.each do |game|
    Game.create!(:title => game['title'], :genre => game['genre'], :score => game['score'], :developer => game['developer'])
  end
end
#   When i switch it to regex it doesn't associate it as the step definition..
Then("the developer of '(.*)' should be '(.*)'$/") do |game, dev|
  assert (Game.find_by_title(game).developer == dev)
end

