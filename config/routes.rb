GoodMorningRails::Application.routes.draw do

  devise_for :users,
    #:controllers => {sessions:'sessions'}, # custom controller for API token access
    :skip => [:registrations, :passwords, :sessions]
    as :user do
      #get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      #put 'users' => 'devise/registrations#update', :as => 'user_registration'
      put 'users/password' => 'devise/passwords#update', :as => 'user_password'
      get 'users' => 'sessions#show', :as => 'user_session'
      post 'users/sign_in' => 'sessions#create', :as => 'new_user_session'
      delete 'users/sign_out' => 'sessions#destroy', :as => 'destroy_user_session'
    end

  resources :bookmarks, :except => [:new, :edit]
  resources :stickyboards, :only => [:index, :show, :update]
  resources :kunidays, :only => [:index, :show, :create, :update]
  resources :newsstreams, :except => [:new, :edit]
  resources :velibstations, :except => [:new, :edit]

  match '/weatherreports/home' => 'weatherreports#home'
  match '/weatherreports/full' => 'weatherreports#full'

  match '*catchall' => 'api#options', :via => [:options]

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
