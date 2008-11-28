class Depot::Filefolder < ActiveRecord::Base
  acts_as_taggable
  set_table_name :files_folder
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  has_many :files
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

end
