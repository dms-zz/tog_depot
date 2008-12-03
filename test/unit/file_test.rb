require File.dirname(__FILE__) + '/../test_helper'

class Depot::FileTest < Test::Unit::TestCase
  should_belong_to :user
  should_belong_to :filefolder
  
  should_require_attributes :title
end
