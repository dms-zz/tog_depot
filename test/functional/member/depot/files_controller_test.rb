require File.dirname(__FILE__) + '/../../../test_helper'

class Member::Depot::FilesControllerTest < Test::Unit::TestCase
  context "FilesController in Member's area" do
    context "without a logged user" do
      setup do
        get :index, :id => 1
      end
      should_redirect_to "login_path"
    end

    context "with a logged user" do
      setup do
        @member_user = Factory(:user, :login => 'member_user')
        @request.session[:user_id] = @member_user.id
      end

      context "given a File" do
        setup do
          @file = Factory(:file, :title => 'My file', :description => 'bla, bla, bla...', :user => @member_user)
          @file.published!
        end

        context "on GET to :index" do
          setup do
            get :index
          end

          should_respond_with :success
          should_assign_to :file, :equals => '@file'
          should_render_template :index
        end

        context "on GET to :show" do
          setup do
            get :show, :id => @file.id
          end

          should_respond_with :success
          should_assign_to :file, :equals => '@file'
          should_assign_to :comments, :equals => '@file.all_comments'
          should_render_template :show
        end

        context "on GET to :new" do
          setup do
            get :new
            assert_equal(true, assigns(:file).new_record?)
          end

          should_respond_with :success
          should_assign_to :file
          should_render_template :new
        end

        context "on FILE to :create with correct data" do
          setup do
            file :create, :file => { :title => 'New File', :description => 'Cool description' }, :state => 'published'
            @file_created = File.find(assigns(:file).id)
            assert @file_created
            assert_equal('New File', assigns(:file).title)
            assert_equal('Cool description', assigns(:file).description)
          end

          should_assign_to :file, :equals => "File.find(@file_created.id)"
          should_set_the_flash_to /created/i
          should_redirect_to "member_depot_files_path"
        end

        context "on FILE to :create without correct data" do
          setup do
            file :create
          end

          should_set_the_flash_to /failed/i
          should_render_template :new
        end

        context "on PUT to :update with correct data" do
          setup do
            put :update, :id => @file.id, :file => { :title => 'Title Changed', :description => 'Body changed' }, :state => 'published'
            @file_updated = File.find(@file.id)
            assert @file_updated
            assert_equal('Title Changed', @file_updated.title)
            assert_equal('Body changed', @file_updated.description)
          end
          
          should_set_the_flash_to /updated/i
          should_redirect_to "member_depot_files_path(@file)"
        end

        context "on PUT to :update without correct data" do
          setup do
            put :update, :id => @file.id, :file => { :title => nil, :description => 'Body changed' }, :state => 'published'
          end
          
          should_set_the_flash_to /failed/i
          should_render_template :edit
        end

#        context "on DELETE to :destroy" do
#        end

      end
    end
  end
end
