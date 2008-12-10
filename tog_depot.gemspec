Gem::Specification.new do |s|
  s.name     = "tog_depot"
  s.version  = "0.2.1"
  s.date     = "2008-12-10"
  s.summary  = "Tog Plugin"
  s.email    = "jorge.fernandez@dmsti.es"
  s.homepage = "http://github.com/dms/tog_depot/tree/master"
  s.description = "Depot is a file management system for Tog:Community Framework"
  s.has_rdoc = true
  s.authors  = ["Ignacio Vega", "Jorge F. Simarro"]
  s.files    = ["CHANGELOG.md", 
		"MIT-LICENSE",
		"init.rb",
		"README.markdown", 
		"Rakefile", 
		"tog_depot.gemspec", 
		"app/views/depot/filefolders/show.html.erb",
 		"app/views/depot/files/show.html.erb",
	  "app/views/depot/files/_tag_cloud_file.html.erb",
 		"app/views/depot/files/by_tag.html.erb",
 		"app/views/depot/files/index.html.erb",
 		"app/views/member/depot/filefolders/show.html.erb",
 		"app/views/member/depot/filefolders/new.html.erb",
 		"app/views/member/depot/filefolders/edit.html.erb",
 		"app/views/member/depot/files/show.html.erb",
 		"app/views/member/depot/files/new.html.erb",
 		"app/views/member/depot/files/edit.html.erb",
 		"app/views/member/depot/files/by_tag.html.erb",
 		"app/views/member/depot/files/index.html.erb",
 		"app/models/user.rb", 
  	"app/models/depot/filefolder.rb",
 		"app/models/depot/file.rb",
 		"app/models/tog/depot/version.rb",
 		"app/helpers/depot/files_helper.rb",
 		"app/controllers/depot/files_controller.rb",
 		"app/controllers/depot/filefolders_controller.rb",
 		"app/controllers/member/depot/files_controller.rb",
 		"app/controllers/member/depot/filefolders_controller.rb",
 		"public/images/tog-depot_iconfolder_48px.gif",
 		"public/images/1px.gif",
 		"public/images/tog-depot_iconfile_16px.gif",
	  "public/images/tog-depot_arrow_dn_deact.gif",
	  "public/images/tog-depot_iconfile_48px.gif",
 		"public/images/tog-depot_iconfile_32px.gif",
 		"public/images/tog-depot_arrow_up.gif",
 		"public/images/tog-depot_arrow_up_deact.gif",
 		"public/images/tog-depot_file_dl.gif",
 		"public/images/tog-depot_arrow_dn.gif",
 		"public/images/tog-depot_iconfolder_32px.gif",
 		"public/images/tog-depot_iconfolder_16px.gif",
 		"public/images/privacity/public_domain.gif",
 		"public/images/privacity/community.gif",
 		"public/images/privacity/member.gif",
 		"public/images/privacity/admin.gif",
 		"public/stylesheets/depot.css",
 		"config/routes.rb",
 		"db/migrate/001_create_files.rb",
 		"db/migrate/002_create_files_folder.rb"]
  s.test_files = ["test/test_helper.rb",
		"test/factories.rb",
		"test/unit/file_test.rb",
		"test/unit/filefolder_test.rb",
		"test/functional/depot/filefolders_controller_test.rb",
		"test/functional/depot/files_controller_test.rb",
		"test/functional/member/depot/filefolders_controller_test.rb",
		"test/functional/member/depot/files_controller_test.rb"]

			
  s.rdoc_options = ["--main", "README.markdown"]
  s.extra_rdoc_files = ["MIT-LICENSE", "CHANGELOG.md", "README.markdown"]
  s.add_dependency("tog_core", ["> 0.0.0"])
  s.add_dependency("seo_urls", ["> 0.0.0"])
  s.add_dependency("attachment_fu", ["> 0.0.0"])
  s.add_dependency("acts_as_rateable", ["> 0.0.0"])
  s.add_dependency("acts_as_taggable_on_steroids", ["> 0.0.0"])
end





