Rails.application.routes.draw do
  
    resources :admin_users do
      member do
        patch :update_password, :reset_password
      end
    end

    resources :contacts do
     collection do
      delete 'destroy_multiple'
     end
    end
      resources :comments, :only => [:create, :destroy] do
    end

    get 'export', to: 'contacts#export', as: :contacts_export
    get 'export_options', to: 'contacts#export_options', as: :contacts_export_options
    
    resource :admin_user_session, :only => [:new, :create, :destroy]
    resource :password_reset, :only => [:create, :edit, :update]
        

    root :to => 'contacts#index'
    
end
