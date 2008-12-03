require File.dirname(__FILE__) + '/../../test_helper'

class Depot::FilesControllerTest < Test::Unit::TestCase

  context "Given a File" do
    setup do
      @controller = Depot::FilesController.new
      @request    = ActionController::TestRequest.new
      @response   = ActionController::TestResponse.new

      @member_user = Factory(:user, :login => 'member_user', :admin => true)
      @filefolder = Factory(:filefolder, :title => 'My Folder', :description => 'Folder description', :user => @member_user)
      @file = Factory(:file, :title => 'My File', :description => 'Cool description', :author => @member_user, :filefolder => @filefolder)
      @file.published!
      Factory(:file, :title => 'My draft draft', :description => 'bla, bla, bla...', :user => @member_user, :filefolder => @filefolder).draft!
    end

    context "on GET to :index" do
      setup do
        get :index
      end

      should_assign_to :filefolders

      should_respond_with :success
      should_render_template :index
    end

    context "on GET to :show" do
      setup do
        Factory(:file, :title => 'Other post', :description => 'bla, bla, bla...', :user => @member_user, :filefolder => @filefolder).draft!
        get :show, :id => @filefolder.id
      end

      should_assign_to :filefolder, :equals => '@filefolder'
      should_assign_to :file, :equals => '@filefolder.published_files'

      should_respond_with :success
      should_render_template :show
    end
  end

end