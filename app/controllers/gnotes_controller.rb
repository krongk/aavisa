class GnotesController < ApplicationController
 # layout 'layouts/application', :except=>[:reply]
 before_filter :manage_login_required, :except=>[:new,:create,:show]
  # GET /gnotes
  # GET /gnotes.xml
  def index
    @gnotes = Gnote.paginate :page=>params[:page]||1, :per_page=>12,:order=>"created_at DESC"

    respond_to do |format|
      format.html { render :layout =>'layouts/manage'}
      format.xml  { render :xml => @gnotes }
    end
  end

  # GET /gnotes/1
  # GET /gnotes/1.xml
  def show
    @gnote = Gnote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gnote }
    end
  end

  # GET /gnotes/new
  # GET /gnotes/new.xml
  def new
    @gnote = Gnote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gnote }
    end
  end

  # GET /gnotes/1/edit
  def edit
    @gnote = Gnote.find(params[:id])
  end

  # POST /gnotes
  # POST /gnotes.xml
  def create
    @gnote = Gnote.new(params[:gnote])

    respond_to do |format|
      if @gnote.save
        flash[:notice] = '问题提交成功.'
        format.html { redirect_to(@gnote) }
        format.xml  { render :xml => @gnote, :status => :created, :location => @gnote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gnote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gnotes/1
  # PUT /gnotes/1.xml
  def update
    @gnote = Gnote.find(params[:id])

    respond_to do |format|
      if @gnote.update_attributes(params[:gnote])
        flash[:notice] = '添加成功.'
        format.html { redirect_to(gnotes_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gnote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gnotes/1
  # DELETE /gnotes/1.xml
  def destroy
    @gnote = Gnote.find(params[:id])
    @gnote.destroy

    respond_to do |format|
      format.html { redirect_to(gnotes_url) }
      format.xml  { head :ok }
    end
  end

  #reply ajax in index.html.erb
  def reply
     @gnote = Gnote.find(params[:id])
     render :layout=>false
  end
end
