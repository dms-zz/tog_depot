class Member::Depot::FilesController < Member::BaseController

  def index
    @my_files = current_user.files.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def new
    @file = current_user.files.new
  end




end
