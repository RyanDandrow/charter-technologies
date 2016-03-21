require 'securerandom'

class AdminUsersController < ApplicationController

  before_filter :needs_admin, :except => [:show, :destroy, :update, :update_password]
  before_filter :needs_admin_or_current_user, :only => [:show, :destroy, :update, :update_password]

  def index
    @search = Contact.search(params[:q])
    @contacts = @search.result.order(sort_order(:name)).paginate(:page => params[:page], :per_page => 10)
    @admin_users = AdminUser.order(sort_order(:name)).paginate(:page => params[:page], :per_page => 10)

    @advanced_search = Contact.search(params[:q])
    @advanced_search.build_condition if @advanced_search.conditions.empty?
    @contacts = @advanced_search.result.order(sort_order(:name)).paginate(:page => params[:page], :per_page => 10)
  end

  def new
  	@admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new admin_user_params
  
    if @admin_user.save
      flash[:notice] = "New user " + @admin_user.name + " has been successfully created."
      redirect_to admin_users_path
    else
      flash.now[:error] = "There were problems when trying to create a new user"
      render :action => :new
    end
  end

  def show
  	@admin_user = AdminUser.find params[:id]
  end

  def update
    @admin_user = AdminUser.find params[:id]

    if @admin_user.update_attributes admin_user_params
      flash[:notice] = @admin_user.name + " has been updated"
    else
      flash.now[:error] = "There were problems when trying to update this user"
      render :action => :show
      return
    end
    
    if @session_user.is_admin?
      redirect_to admin_users_path
    else
      redirect_to :controller => :pages, :action => :dashboard
    end
  end

  def update_password
    @admin_user = AdminUser.find params[:id]
     
    if @admin_user.valid_password? params[:form_current_password]
      if params[:admin_user][:password].blank? && params[:admin_user][:password_confirmation].blank?
        flash[:error] = "New password cannot be blank"
      elsif @admin_user.update_attributes admin_user_params
        flash[:notice] = "Your password has been changed"
      else
        flash[:error] = "There were problems when trying to change your password"
      end
    else
      flash[:error] = "The current password is incorrect"
    end
    
    redirect_to :action => :show
  end

  def reset_password
    @admin_user = AdminUser.find params[:id]
     
      if @admin_user.update_attributes admin_user_params
          flash[:notice] = "Your password has been reset"
      else
        flash[:error] = "There were problems when trying to reset this user's password"
      end
    redirect_to :action => :show
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
