#   Create test database
Given("the following games exist:") do |table|
  table.hashes.each do |game|
    Game.create!(:title => game['title'], :genre => game['genre'], :score => game['score'], :developer => game['developer'])
  end
end

Then("the developer of {string} should be {string}") do |game, dev|
  assert (Game.find_by_title(game).developer == dev)
end

