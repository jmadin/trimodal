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

end
