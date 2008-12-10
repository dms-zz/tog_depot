class Member::Depot::FilesController < Member::BaseController
 
  def index
    if params[:order]
      @order = params[:order]
    else 
      @order = "created_at DESC"
    end
    @my_files = current_user.files.paginate(:per_page => 10, :page => params[:page], :order => @order)
    @my_folders = current_user.filefolders.paginate(:page => params[:page], :order => @order)
		@tot_size = current_user.files.sum('size').to_i / 1024
		@max_storage = Tog::Plugins.settings(:tog_depot, "file.max_size_storage")
  end

  def by_tag
    @tag  =  Tag.find_by_name(params[:tag_name])
    @my_files = current_user.files.find_tagged_with(@tag).paginate(:per_page => 10, :page => params[:page]) unless @tag.nil?
    @my_folders = current_user.filefolders.find_tagged_with(@tag) unless @tag.nil?
  end

  def show
    @file = current_user.files.find(params[:id])
    @extension = @file.filename.to_s.scan(/\.\w+$/)
  end
 
  def new
		@tot_size = current_user.files.sum('size').to_i / 1024
		@max_storage = Tog::Plugins.settings(:tog_depot, "file.max_size_storage")
		if (@max_storage.to_i - @tot_size.to_i)<0
       flash[:error] = 'Your disk quota has been exceeded, please contact your administrator.'
       redirect_to member_depot_files_path
		end
    @folders = current_user.filefolders.paginate(:page => params[:page], :order => "created_at DESC")
  end
 
  def create
    @file = current_user.files.new(params[:file])
    @file.user_id = current_user.id
		@file.num_download=0
 
    respond_to do |wants|
      if @file.save
        @file.send("#{params[:state].to_s}!")
        wants.html do
          flash[:ok] = 'New file Update.'
          redirect_to member_depot_files_path
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
          redirect_to member_depot_files_path
        end
      else
        wants.html do
          flash.now[:error] = 'Failed to Update a new file.'
          render :action => :edit
        end
      end
    end
  end

  def download
    @file = current_user.files.find params[:id]
    @num = @file.num_download+1
    @file.update_attribute (:num_download, @num)
    send_file("public/" + @file.public_filename)
  end
	
  def destroy
    @file = current_user.files.find params[:id]
    @file.destroy
    respond_to do |wants|
      wants.html do
        flash[:ok]='File deleted.'
        redirect_to member_depot_files_path
      end
    end
    
  end

end
