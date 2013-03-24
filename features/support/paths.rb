module NavigationHelpers
  
  # Extend the standard PathMatchers with your own paths
  # to be used in your features.
  # 
  # The keys and values here may be used in your standard web steps
  # Using:
  #
  #   When I go to the "cells" admin page
  # 
  # would direct the request to the path you provide in the value:
  # 
  #   admin_cells_path
  # 
  PathMatchers = {} unless defined?(PathMatchers)
  PathMatchers.merge!({
    # /cells/i => 'admin_cells_path'
  })
  
end

World(NavigationHelpers)