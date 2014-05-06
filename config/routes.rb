Trimodal::Application.routes.draw do

  resources :contributors

  resources :fecund_corals

  resources :ss_corals

  resources :spawners

  resources :touches

  resources :people do
    resources :spawners
  end

  resources :fieldtrips do
    resources :observations
    resources :spawners
    resources :ss_corals
    resources :fecund_corals
  end

  resources :observations do
    resources :areas
  end

  resources :areas do
    resources :touches
  end

  resources :corals do
    resources :observations do
      resources :areas do
        resources :touches
      end
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  root  'static_pages#home'
  match '/signup',  to: 'contributors#new',      via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  match '/home', to: 'static_pages#home', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'


  # match 'export_touches' => 'corals#export_tagged', via: 'get'
  match 'export_tagged' => 'corals#export_tagged', via: 'get'
  match 'export_corals' => 'corals#export_corals', via: 'get'
  match 'export_spawners' => 'spawners#export_spawners', via: 'get'
  match 'export_size_structure' => 'ss_corals#export_size_structure', via: 'get'
  match 'export_fecundity' => 'fecund_corals#export_fecundity', via: 'get'


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
  # root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
