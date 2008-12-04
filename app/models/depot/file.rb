class Depot::File < ActiveRecord::Base

# set_table_name :files

  acts_as_commentable
  acts_as_taggable
#  acts_as_list :scope => :filefolder
  seo_urls

  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :filefolder, :class_name => "Depot::Filefolder", :foreign_key => "filefolder_id"
 
  has_attachment :storage => :file_system,
                 :max_size => Tog::Plugins.settings(:tog_depot, "file.max_size_file").to_i.kilobytes,
                 :path_prefix=>'public/system/files'
  validates_as_attachment

  attr_accessible :title, :description, :filefolder_id, :tag_list, :published

  validates_presence_of :title

  acts_as_state_machine :initial => :draft

  state :draft
  state :published

  event :published do
    transitions :from => [:draft] , :to => :published
  end

  event :draft do
    transitions :from => [:published] , :to => :draft
  end


  def owner
    user
  end

end

