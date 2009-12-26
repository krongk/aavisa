class ItemsController < ApplicationController
  layout 'layouts/manage',:except=>[:tag]
  before_filter :manage_login_required, :except=>[:show,:tag]
  #layout 'layouts/application', :only=>[:show]
  caches_action [:show,:tag]
	# GET /items
  # GET /items.xml
  def index
			@items = Item.paginate :page =>params[:page]||1, :per_page =>30,:order=>"sort_id desc,updated_at DESC"
      tag_cloud
      
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])
		
    tag_cloud
    
    respond_to do |format|
      if params[:manage]
        format.html {render :layout=>"layouts/manage"}
      else
        format.html {render :layout=>"layouts/application"}
      end
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new
		@item.project_id = params[:project_id]
		@projects = Project.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
		
		@projects = Project.all
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])
		

    respond_to do |format|
      if @item.save
        flash[:notice] = '文章添加成功.'
        expire_action :action=>"show", :id=>@item.id
        format.html { redirect_to("/items/#{@item.id}?manage=1") }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = '文章更新成功.'
        expire_action :action=>"show", :id=>@item.id
        format.html { redirect_to("/items/#{@item.id}?manage=1") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
  #tag
   def tag_cloud
      @tags = Item.tag_counts
    end
	def tag
		@items=  Item.find_tagged_with(params[:id]).paginate :page=>params[:page]||1,:per_page=>20,:order=>"updated_at desc"
    respond_to do |format|
      format.html { render :layout=>"layouts/application" }
      format.xml  { head :ok }
    end
	end
end
