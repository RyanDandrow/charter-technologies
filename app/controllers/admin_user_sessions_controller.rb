class AdminUserSessionsController < ApplicationController
    skip_before_filter :authorise, :only => [:new, :create]
    before_filter :requires_no_session_user, :except => [:destroy]
  
    layout 'application_auth'
  
    def new
      @admin_user_session = AdminUserSession.new
    end
  
    def create
      @admin_user_session = AdminUserSession.new params[:admin_user_session]
      if @admin_user_session.save
        redirect_back_or_default :controller => :pages, :action => :dashboard
      else
        render :action => :new
      end
    end
  
    def destroy
      current_admin_user_session.destroy
      redirect_to new_admin_user_session_url
    end

  private
  
    def requires_no_session_user
      if current_user
        redirect_to :controller => :pages, :action => :dashboard
      end
    end
end