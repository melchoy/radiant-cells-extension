# Uncomment this if you reference any of your controllers in activate
# require_dependency "application_controller"
require "radiant-cells-extension"

class CellsExtension < Radiant::Extension
  version     RadiantCellsExtension::VERSION
  description RadiantCellsExtension::DESCRIPTION
  url         RadiantCellsExtension::URL

  # See your config/routes.rb file in this extension to define custom routes

  extension_config do |config|
    # config is the Radiant.configuration object
  end

  def activate    
    Page.send :include, RadiantCells::Tags
  end
end
