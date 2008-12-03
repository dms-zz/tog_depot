class Depot::FilefoldersController < ApplicationController

  helper 'depot/files'

  def index
    @folder = Depot::Filefolder.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def show
    @folder = Depot::Filefolder.find params[:id]
    @my_files = Depot::File.paginate(:page => params[:page], :order => "created_at DESC", :conditions => ["filefolder_id=? and state=?", params[:id], 'published'])
  end

end
