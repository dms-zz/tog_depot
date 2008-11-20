class User < ActiveRecord::Base
  has_many :files, :class_name => "Depot::File"
end
