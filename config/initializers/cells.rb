## Cell configuration for Radiant Extensions
([RADIANT_ROOT] + Radiant::Extension.descendants.map(&:root) + ["#{RAILS_ROOT}/design", RAILS_ROOT]).each do |ext_path|
  cell_path = ext_path=="#{RAILS_ROOT}/design" ? "#{ext_path}/cells" : "#{ext_path}/app/cells"
  cell_files = Dir.glob("#{cell_path}/*_cell.rb").map {|f| File.basename(f)}

  #Modify view paths for ::Cell::Base to include local cell view directories
  ::Cell::Base.view_paths.unshift cell_path

  #Add CELL_PATH to Rails $LOAD_PATH
  $LOAD_PATH.unshift cell_path

  #Autoload cells - we have to do this here, since cells are defined in the top-level namespace.
  #If there aren't any conflicts with other aspects of the system, you could do a normal require here.
  cell_files.each {|f| autoload f.split('.')[0].classify.to_sym, f}
end
