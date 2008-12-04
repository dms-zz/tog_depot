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
  file.depot_files_order    'depot/files/order/:order',  :action => 'index'
end

with_options(:controller => 'member/depot/files', :conditions => { :method => :get }) do |file|
  file.tag_member_depot_files      'member/depot/files/tag/:tag_name', :action => 'by_tag'
end
