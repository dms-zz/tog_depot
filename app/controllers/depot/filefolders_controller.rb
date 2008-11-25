class Depot::FileFoldersController < ApplicationController
  def index
    @folder = Depot::FileFolders.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def show
    @folder = Depot::FileFolder.find params[:id]
  end

end
