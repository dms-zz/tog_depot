class Depot::Filefolder < ActiveRecord::Base
  set_table_name :files_folder
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  has_many :files, :order => 'created_at DESC', :dependent => :destroy
  validates_presence_of :title
end
