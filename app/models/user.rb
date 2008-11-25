class User < ActiveRecord::Base
  has_many :files, :class_name => "Depot::File"
  has_many :filefolders, :class_name => "Depot::Filefolder"
end
