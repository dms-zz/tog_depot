class Member::Depot::FilefoldersController < Member::BaseController
 
  def index
    @my_folders = current_user.filefolders.paginate(:page => params[:page], :order => "created_at DESC")
  end
 
  def show
    @filefolder = current_user.filefolders.find(params[:id])
    @my_files = current_user.files.paginate(:page => params[:page], :order => "created_at DESC", :conditions => ["filefolder_id=?",params[:id]])
  end
 
  def new
  end
 
  def create
    @folder = current_user.filefolders.new(params[:folder])
    @folder.save!
    
    flash[:ok] = "Folder created successfully"
    redirect_to member_depot_files_path
 
  end
 
end
 
