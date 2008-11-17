# == Schema Information
# Schema version: 1
#
# Table name: files
#
#  id           :integer(11)   not null, primary key
#  title        :string(255)
#  description  :text
#  user_id      :integer(11)
#  created_at   :datetime
#  updated_at   :datetime
#  filename     :string(255)
#  size         :integer(11)
#


class Depot::File < ActiveRecord::Base

set_table_name :files

  acts_as_commentable
  acts_as_taggable
  seo_urls
  
  belongs_to :users

#####hasta aqui 13/11/2008


  validates_presence_of :title

end

