class Depot::FilefoldersController < ApplicationController

  helper 'depot/files'

  def show
    @folder = Depot::Filefolder.find params[:id]
    @my_files = Depot::File.paginate(:per_page => 10, :page => params[:page], :order => "created_at DESC", :conditions => ["filefolder_id=? and state=?", params[:id], 'public'])
  end

end
