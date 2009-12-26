class SignsController < ApplicationController
  layout 'layouts/manage', :except=>[:new,:create,:show]
  before_filter :manage_login_required, :except=>[:new,:create,:show]
  before_filter :login_required,:only=>[:new,:create,:show]
  #layout 'layouts/application', :only=>[:new,:create,:show]
  # GET /signs
  # GET /signs.xml
  def index
    @signs = Sign.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @signs }
    end
  end

  # GET /signs/1
  # GET /signs/1.xml
  def show
    @sign = Sign.find(params[:id])

    respond_to do |format|
      format.html {render :layout=>"layouts/application"}
      format.xml  { render :xml => @sign }
    end
  end

  # GET /signs/new
  # GET /signs/new.xml
  def new
    
    @sign = Sign.new

    respond_to do |format|
      format.html {render :layout=>'layouts/application'}
      format.xml  { render :xml => @sign }
    end
  end

  # GET /signs/1/edit
  def edit
    @sign = Sign.find(params[:id])
  end

  # POST /signs
  # POST /signs.xml
  def create
    @sign = Sign.new(params[:sign])
      @sign.is_contract=false
      @sign.is_valid=true
    
    respond_to do |format|
      if @sign.save
        flash[:notice] = '报名成功.'
        format.html { redirect_to(@sign) }
        format.xml  { render :xml => @sign, :status => :created, :location => @sign }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sign.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /signs/1
  # PUT /signs/1.xml
  def update
    @sign = Sign.find(params[:id])
    
    respond_to do |format|
      if @sign.update_attributes(params[:sign])
        if @sign.is_contract
          @sign.record_code=["LX",Date.today.to_s.split("-").join().to_s,"00",@sign.id].join
          @sign.save
        else
          @sign.record_code=""
          @sign.save
        end
        flash[:notice] = '信息更新成功.'
        format.html { redirect_to(edit_sign_path(@sign)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sign.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /signs/1
  # DELETE /signs/1.xml
  def destroy
    @sign = Sign.find(params[:id])
    @sign.destroy

    respond_to do |format|
      format.html { redirect_to(signs_url) }
      format.xml  { head :ok }
    end
  end
end
