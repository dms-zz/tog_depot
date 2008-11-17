class Depot::FilesController < ApplicationController
  def index
    @files = Depot::File.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def show
    @page = params[:page] || '1'

    @file = Depot::File.find params[:id]
    @files = @file.depot.paginate :per_page => 10,
                                            :page => @page, 
                                            :order => "created_at desc"

  end

  def new
  end

end

