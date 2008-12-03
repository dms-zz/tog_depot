require File.dirname(__FILE__) + '/../../test_helper'

class Depot::FilefoldersControllerTest < Test::Unit::TestCase

  context "Given a Filefolder" do
    setup do
      @controller = Depot::FilefoldersController.new
      @request    = ActionController::TestRequest.new
      @response   = ActionController::TestResponse.new

      @member_user = Factory(:user, :login => 'member_user', :admin => true)
      @filefolder = Factory(:filefolder, :title => 'My Folder', :description => 'Folder description', :user => @member_user)
      @file.published!
      filefolder(:filefolder, :title => 'My draft draft', :description => 'bla, bla, bla...', :user => @member_user).draft!
    end

    context "on GET to :show" do
      setup do
        Factory(:filefolder, :title => 'Other post', :description => 'bla, bla, bla...', :user => @member_user).draft!
        get :show, :id => @filefolder.id
      end

      should_assign_to :filefolder, :equals => '@filefolder'

      should_respond_with :success
      should_render_template :show
    end
  end

end