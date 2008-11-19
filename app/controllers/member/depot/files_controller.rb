class Member::Depot::FilesController < Member::BaseController

  def index
    @my_files = current_user.files.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def new
  end

  def create
    @file = current_user.files.build(params[:file])
    @file.user_id = current_user.id

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

end
