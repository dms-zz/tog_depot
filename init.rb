require_plugin 'tog_core'
require_plugin 'seo_urls'

Tog::Interface.sections(:site).add "Files", "/depot/files"     

Tog::Interface.sections(:member).add "My files", "/member/depot/files"

#Tog::Plugins.helpers Files::FilesHelper
