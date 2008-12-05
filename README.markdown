Depot
===========

File management system for TOG:Community framework.

Included functionality
---------------------- 

* File management
* Folder management
* Filesize and disk cuota configuration
* Tag system
* File and folder privacity
* Abuse report
* And more...

Resources
=========

Plugin requirements
-------------------

In case you haven't got any of them installed previously, you'll need the following plugins on your application:

* [acts\_as\_commentable](https://github.com/tog/tog/wikis/3rd-party-plugins-acts_as_commentable)
* [attachment\_fu](http://github.com/technoweenie/attachment_fu/tree/master)
* [acts\_as\_taggable\_on\_steroids](https://github.com/tog/tog/wikis/3rd-party-plugins-acts_as_taggable_on_steroids)

Follow each link above for a short installation guide incase you have to install them.

Install
-------

* Install plugin form source:
<pre>
ruby script/plugin install git://github.com/dms/tog_depot.git
</pre>

* Add Depot's routes to your application's config/routes.rb
<pre>
map.routes_from_plugin 'tog_depot'
</pre>

* Add plugin static resources to public app:
<pre>
rake tog:plugins:copy_resources
</pre>

* Generate installation migration:
<pre>
ruby script/generate migration install_tog_depot
</pre>

* With the following content:
<pre>
class InstallTogDepot < ActiveRecord::Migration
  def self.up
    migrate_plugin "tog_depot", 2
  end

  def self.down
    migrate_plugin "tog_depot", 0
  end
end
</pre>

* And finally...
<pre>rake db:migrate</pre> 


More
-------
Released under the MIT license

[http://dmsti.es](http://dmsti.es)

DMS 2008, Desarrollo de Medios y Sistemas. 
