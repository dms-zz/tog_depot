class Admin::Depot::FilesController < Admin::BaseController

  def index
    @files = Depot::Files.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def show
    @file = Depot::Files.find(params[:id])
    @extension = @file.filename.to_s.scan(/\.\w+$/)
  end

  def new
    @folders = current_user.filefolders.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def create
    @file = current_user.files.new(params[:file])
    @file.user_id = current_user.id

    respond_to do |wants|
      if @file.save
        @file.send("#{params[:state].to_s}!")
        wants.html do
          flash[:ok] = 'New file Update.'
          redirect_to admin_depot_files_path
        end
      else
        wants.html do
          flash.now[:error] = 'Failed to Update a new file.'
          render :action => :new
        end
      end
    end
  end
  
  def tags
  end  

  def edit
    @file = current_user.files.find(params[:id])
    @folders = current_user.filefolders.paginate(:page => params[:page], :order => "created_at DESC")
  end
	
  def update
    @file = current_user.files.find(params[:id])
    respond_to do |wants|
      if @file.update_attributes(params[:file])
         @file.send("#{params[:state].to_s}!")
				 wants.html do
          flash[:ok] = "File <b>#{@file.title}</b> succcessfully updated!"
          redirect_to admin_depot_files_path
        end
      else
        wants.html do
          flash.now[:error] = 'Failed to Update a new file.'
          render :action => :edit
        end
      end
    end
  end

end