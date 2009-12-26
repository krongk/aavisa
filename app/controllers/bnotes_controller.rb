class BnotesController < ApplicationController
  layout "layouts/application", :except=>[:reply]
  before_filter :manage_login_required,:except=>[:new,:create,:show]
  # GET /bnotes
  # GET /bnotes.xml
  def index
    @bnotes = Bnote.paginate :page=>params[:page]||1, :per_page=>12,:order=>"created_at DESC"

    respond_to do |format|
      format.html { render :layout=>"layouts/manage"}
      format.xml  { render :xml => @bnotes }
    end
  end

  # GET /bnotes/1
  # GET /bnotes/1.xml
  def show
    @bnote = Bnote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bnote }
    end
  end

  # GET /bnotes/new
  # GET /bnotes/new.xml
  def new
    @bnote = Bnote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bnote }
    end
  end

  # GET /bnotes/1/edit
  def edit
    @bnote = Bnote.find(params[:id])
  end

  # POST /bnotes
  # POST /bnotes.xml
  def create
    @bnote = Bnote.new(params[:bnote])

    respond_to do |format|
      if @bnote.save
        flash[:notice] = '信息添加成功.'
        format.html { redirect_to(@bnote) }
        format.xml  { render :xml => @bnote, :status => :created, :location => @bnote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bnote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bnotes/1
  # PUT /bnotes/1.xml
  def update
    @bnote = Bnote.find(params[:id])

    respond_to do |format|
      if @bnote.update_attributes(params[:bnote])
        flash[:notice] = '信息更新成功.'
        format.html { redirect_to(bnotes_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bnote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bnotes/1
  # DELETE /bnotes/1.xml
  def destroy
    @bnote = Bnote.find(params[:id])
    @bnote.destroy

    respond_to do |format|
      format.html { redirect_to(bnotes_url) }
      format.xml  { head :ok }
    end
  end
   #reply ajax in index.html.erb
  def reply
     @bnote = Bnote.find(params[:id])
  end
end
