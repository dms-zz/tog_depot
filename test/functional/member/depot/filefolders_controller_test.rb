require File.dirname(__FILE__) + '/../../../test_helper'

class Member::Depot::FilefoldersControllerTest < Test::Unit::TestCase

  def setup
    @member_user = Factory(:user, :login => 'member_user', :admin => true)
    @filefolder = Factory(:filefolder, :title => 'My Blog', :description => 'Cool description', :user => @member_user)

    @controller = Member::Conversatio::FilefoldersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @request.session[:user_id] = @member_user.id
  end

end