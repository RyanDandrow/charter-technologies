Rails.application.routes.draw do
  
    resources :admin_users do
      member do
        patch :update_password, :reset_password
      end
    end

    resources :contacts
    
    resource :admin_user_session, :only => [:new, :create, :destroy]
    resource :password_reset, :only => [:create, :edit, :update]
        

    root :to => 'pages#dashboard'
    
end
