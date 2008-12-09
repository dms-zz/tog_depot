class Depot::Filefolder < ActiveRecord::Base
  acts_as_taggable
  set_table_name :files_folder
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  has_many :files
  validates_presence_of :title

  acts_as_state_machine :initial => :public, :column => 'state'

  state :private
  state :public

  event :public do
    transitions :from => [:private] , :to => :public
  end

  event :private do
    transitions :from => [:public] , :to => :private
  end

end
