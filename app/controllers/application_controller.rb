class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'authlogic'

  	require 'application_helper'
  	include ApplicationHelper 

    layout 'app_nav'
   
    helper_method :current_admin_user_session, :current_user
    before_filter :authorise

    ActionView::Base.field_error_proc = proc { |input, instance| "#{input}".html_safe }

  private
  
    def authorise    
      unless current_user
        session[:return_to] = request.fullpath
        redirect_to new_admin_user_session_url
        return false
      end
    end
  
    def current_admin_user_session
      return @current_admin_user_session if defined?(@current_admin_user_session)
      @current_admin_user_session = AdminUserSession.find
    end

    def current_user
      return @session_user if defined?(@session_user)
      @session_user = current_admin_user_session && current_admin_user_session.admin_user
    end
  
    def needs_admin
      unless @session_user.is_admin?
        redirect_to :controller => :contacts, :action => :index
      end
    end
  
    def needs_admin_or_current_user
      unless @session_user.is_admin? || params[:id].to_i == @session_user.id
        redirect_to :controller => :contacts, :action => :index
      end
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def sort_order(default)
      "#{(params[:c] || default.to_s).gsub(/[\s;'\"]/,'')} #{'ASC' if params[:d] == 'up'} #{'DESC' if params[:d] == 'down'}"
    end
end
