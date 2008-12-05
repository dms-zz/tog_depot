class Member::Depot::FilefoldersController < Member::BaseController
 
  def show
    @filefolder = current_user.filefolders.find(params[:id])
    @my_files = current_user.files.paginate(:per_page => 10, :page => params[:page], :order => "created_at DESC", :conditions => ["filefolder_id=?",params[:id]])
  end
 
  def new
  end
 
  def create
    @folder = current_user.filefolders.new(params[:folder])
    if @folder.save!
			flash[:ok] = "Folder created successfully"
			redirect_to member_depot_files_path
		else
			redirect_to member_depot_files_path
		end
 
  end
 
  def edit
    @filefolder = current_user.filefolders.find(params[:id])
  end

  def update
    @filefolder = current_user.filefolders.find(params[:id])
    respond_to do |wants|
      if @filefolder.update_attributes(params[:filefolder])
         wants.html do
          flash[:ok] = "Folder <b>#{@filefolder.title}</b> succcessfully updated!"
          redirect_to member_depot_files_path
        end
      else
        wants.html do
          flash.now[:error] = 'Failed to Update a filefolder.'
          render :action => :edit
        end
      end
    end
  end

  def destroy
    @folder = current_user.filefolders.find params[:id]
    @my_files = current_user.files.paginate(:page => params[:page], :order => "created_at DESC", :conditions => ["filefolder_id=?",params[:id]])

    if @my_files.empty?
			@folder.destroy
			respond_to do |wants|
				wants.html do
					flash[:ok]='Folder deleted.'
					redirect_to member_depot_files_path
				end
			end
		else
          flash[:error] = 'This folder cannot be deleted, because there are still any files into it.'
          redirect_to member_depot_filefolder_path
		end
    
  end
	
end
 
