class AnotesController < ApplicationController
  layout 'layouts/application', :except=>["reply"]
  before_filter :manage_login_required,:except=>[:new,:create,:show]
  ## GET /anotes
  # GET /anotes.xml
  def index
    @anotes = Anote.paginate :page=>params[:page]||1, :per_page=>12,:order=>"created_at DESC"

    respond_to do |format|
      format.html { render :layout=>"layouts/manage"}
      format.xml  { render :xml => @anotes }
    end
  end

  # GET /anotes/1
  # GET /anotes/1.xml
  def show
    @anote = Anote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @anote }
    end
  end

  # GET /anotes/new
  # GET /anotes/new.xml
  def new
    @anote = Anote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @anote }
    end
  end

  # GET /anotes/1/edit
  def edit
    @anote = Anote.find(params[:id])
  end

  # POST /anotes
  # POST /anotes.xml
  def create
    @anote = Anote.new(params[:anote])

    respond_to do |format|
      if @anote.save
        flash[:notice] = '评估信息添加成功.'
        format.html { redirect_to(@anote) }
        format.xml  { render :xml => @anote, :status => :created, :location => @anote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @anote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /anotes/1
  # PUT /anotes/1.xml
  def update
    @anote = Anote.find(params[:id])

    respond_to do |format|
      if @anote.update_attributes(params[:anote])
        flash[:notice] = '信息更新成功.'
        format.html { redirect_to(anotes_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @anote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /anotes/1
  # DELETE /anotes/1.xml
  def destroy
    @anote = Anote.find(params[:id])
    @anote.destroy

    respond_to do |format|
      format.html { redirect_to(anotes_url) }
      format.xml  { head :ok }
    end
  end
   #reply ajax in index.html.erb
  def reply
     @anote = Anote.find(params[:id])
  end
end
