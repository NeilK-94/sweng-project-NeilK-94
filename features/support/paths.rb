# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/games'
  
    # Add 'show' page mapping
    when /^the details page for "(.*)"$/
        game_to_view = Game.find_by_title($1)
        game_path(game_to_view)

    # Add Similar Games page mapping
    when /^the Similar Games page for "(.*)"$/
        game_to_find = Game.find_by_title($1)
        search_developers_path(game_to_find)

    # Add edit page mapping
    when /^the edit page for "(.*)"$/
      # $1 is name of game to edit
      game_to_edit = Game.find_by_title($1)
      edit_game_path(game_to_edit)
    
      # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
