require 'securerandom'

class AdminUsersController < ApplicationController

  before_filter :needs_admin, :except => [:show, :destroy, :update, :update_password]
  before_filter :needs_admin_or_current_user, :only => [:show, :destroy, :update, :update_password]

  def index
    @page_title = "Users"
    @admin_users = AdminUser.all
  end

  def new
    @page_title = "Add a new user"
  	@admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new admin_user_params
  
    if @admin_user.save
      flash[:notice] = "New user " + @admin_user.name + " has been successfully created."
      redirect_to admin_users_path
    else
      flash.now[:warning] = "There were problems when trying to create a new user"
      render :action => :new
    end
  end

  def show
  	@admin_user = AdminUser.find params[:id]
  	@page_title = @admin_user.name + " > View user"
  end

  def update
    @admin_user = AdminUser.find params[:id]
    @page_title = @admin_user.name + " > Update user"

    if @admin_user.update_attributes admin_user_params
      flash[:notice] = @admin_user.name + " has been updated"
    else
      flash.now[:warning] = "There were problems when trying to update this user"
      render :action => :show
      return
    end
    
    if @session_user.is_admin?
      redirect_to admin_users_path
    else
      redirect_to :controller => :pages, :action => :dashboard
    end
  end

  def destroy
    user = AdminUser.find params[:id]
    if user.is_admin? == false || AdminUser.has_more_than_one_admin
      user.destroy
      flash[:notice] = user.name + " has been deleted"
    end
    redirect_to admin_users_path
  end

  private

    def admin_user_params
      params.require(:admin_user).permit(:name, :email, :access_level, :password, :password_confirmation)
    end

end
