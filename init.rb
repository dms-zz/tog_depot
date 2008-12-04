require_plugin 'tog_core'
require_plugin 'seo_urls'
require_plugin 'attachment_fu'
require_plugin 'acts_as_rateable'
require_plugin 'acts_as_taggable_on_steroids'

Tog::Interface.sections(:site).add "Files", "/depot/files"     

Tog::Interface.sections(:member).add "My files", "/member/depot/files"

Tog::Plugins.settings :tog_depot, "file.max_size_file"	=> "5000",
                                  "file.max_size_storage"	=> "500000"

#Tog::Plugins.helpers Files::FilesHelper
