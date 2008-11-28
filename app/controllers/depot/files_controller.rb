class Depot::FilesController < ApplicationController
  def index
    @files = Depot::File.paginate(:page => params[:page], :order => "created_at DESC",  :conditions => ['state = ?', 'published'])
    @folders = Depot::Filefolder.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def show

    @file = Depot::File.find params[:id]
    @extension = @file.filename.to_s.scan(/\.\w+$/)
  end

end

