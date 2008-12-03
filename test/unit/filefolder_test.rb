require File.dirname(__FILE__) + '/../test_helper'

class Depot::FilefolderTest < Test::Unit::TestCase
  should_belong_to :user
  should_have_many :files
  
  should_require_attributes :title
end
