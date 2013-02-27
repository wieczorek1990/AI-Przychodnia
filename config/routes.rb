Projekt::Application.routes.draw do
  resources :admins

  resources :patients

  resources :doctors

  resources :clinics
  
  resources :clinic_doctors

  resources :work_plans

  resources :appointments do
    member do
      put 'confirm'
    end
    collection do
      get 'first_clinic'
      post 'first_clinic_create'
      get 'first_doctor'
      post 'first_doctor_create'
    end
  end
  
    #match 'appointments/update_doctor_select/:id', :controller=>'appointments', :action => 'update_doctor_select'
 
  resources :unconfirmed_users, :only => [:index, :update, :destroy] do
    member do
      put 'confirm'
    end
  end

  resources :doctor_work_plans, :only => [:index]

  resources :available_appointments, :only => [:index]

  devise_for :users, :patients, :doctors, :path_prefix => 'accounts'
  
  root :to => "home#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
