# Add your custom routes here.  If in config/routes.rb you would 
# add <tt>map.resources</tt>, here you would add just <tt>resources</tt>

# resources :tog_depot

namespace(:depot) do |depot|
  depot.resources :filefolders
  depot.resources :filefolders, :collection => {:tags => :get}
  depot.resources :files
  depot.resources :files, :collection => {:tags => :get}
end

namespace(:member) do |member| 
   member.namespace(:depot) do |depot|
      depot.resources :filefolders
      depot.resources :filefolders, :collection => {:tags => :get}
      depot.resources :files
      depot.resources :files, :collection => {:tags => :get}
   end
end

with_options(:controller => 'depot/files', :conditions => { :method => :get }) do |file|
  file.tag_depot_files      'depot/files/tag/:tag_name', :action => 'by_tag'
end

#with_options(:controller => 'depot/files', :conditions => { :method => :get }) do |post|
#  file.tag_depot_files      'depot/files/:file_id/tag/:tag_name', :action => 'by_tag'
#end
