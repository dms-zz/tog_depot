class Depot::FilesController < ApplicationController
  def index
    @files = Depot::File.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def show

    @file = Depot::File.find params[:id]
    @extension = @file.filename.scan(/\.\w+$/)
  end

end

