Rails.application.routes.draw do
  
  match "/" => redirect("/admin_user_session/new"), :via => :get
  
  
  
    resources :admin_users do
      member do
        patch :update_password, :reset_password
      end
    end
    
    resource :admin_user_session, :only => [:new, :create, :destroy]
    resource :password_reset, :only => [:create, :edit, :update]
        

    root 'pages#dashboard'
end
