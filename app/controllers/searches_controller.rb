class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.xml
  def index
    if params[:q]
    @items = Search.items.with(params[:q]).paginate :page=>params[:page]||1,:per_page=>12,:order=>"created_at DESC"
		#@projects = Search.projects.with(params[:q])
		#@photos = Search.photos.with(params[:q])
    else
      @items = Item.paginate :page=>params[:page]||1,:per_page=>12
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @searches }
    end
  end

 
end
