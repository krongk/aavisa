# This controller handles the login/logout function of the site.  
class ManageSessionsController < ApplicationController

  layout "/layouts/blank"

  def index
    
  end
  # render new.rhtml 登录
  def new
  end

  def create
    self.current_manage = Manage.authenticate(params[:login], params[:password])
    if manage_logged_in?
      if params[:remember_me] == "1"
        current_manage.remember_me unless current_manage.remember_token?
        cookies[:auth_token] = { :value => self.current_manage.remember_token , :expires => self.current_manage.remember_token_expires_at }
      end
      redirect_back_or_default('/projects')
      flash[:notice] = "成功登录!"
    else
      render :action => 'new'
    end
  end

  def destroy
    self.current_manage.forget_me if logged_in?
    cookies.delete :auth_token
    #reset_session
    session[:manage_id]=nil
    flash[:notice] = "成功退出."
    redirect_back_or_default('/')
  end
end
