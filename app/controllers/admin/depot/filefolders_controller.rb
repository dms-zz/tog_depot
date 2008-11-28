class Admin::Depot::FilefoldersController < Admin::BaseController

  def index
    @my_folders = Depot::Filefolders.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def show
    @filefolder = Depot::Filefolders.find(params[:id])
    @my_files = Depot::Files.paginate(:page => params[:page], :order => "created_at DESC", :conditions => ["filefolder_id=?",params[:id]])
  end

  def new
  end

  def create
    @folder = current_user.filefolders.new(params[:folder])
    @folder.save!
    
    flash[:ok] = "Folder created successfully"
    redirect_to admin_depot_files_path

  end

end
