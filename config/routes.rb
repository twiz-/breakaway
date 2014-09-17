Breakaway::Application.routes.draw do
  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root to: "marketing#splash"
  get '/about', to: 'marketing#about'
  
  devise_for :club_players, :controllers => {:registrations => "players/registrations",
                                        :sessions => "players/sessions",
                                        :passwords => "players/passwords"} 
                                        
 
  devise_for :college_coaches, :controllers => {:registrations => "coaches/registrations",
                                        :sessions => "coaches/sessions", 
                                        :passwords => "coaches/passwords"}
  authenticated :club_player do 
    resources :links    
    get '/upgrade', to: 'dashboard#upgrade'
    post '/create_link', to: 'dashboard#create_short_url', as: 'generate_short_link'    
    resources :listings, except: :show
    resources :charges
    resources :games
    patch '/cancel_subscription', to: 'dashboard#cancel_subscription'
  end
  authenticated :college_coach do
    get 'friendships/:friend_id' => 'user_friendships#new', :as => :new_friendship  
    put '/e/:profile_name', to: "profiles#email_club_coach", as: 'send_coach_email'
  end

  get "profiles/show" 
  
  get '/players', to: "profiles#index", as: 'club_players'
  get "dashboard/show"
  get "dashboard", to: "dashboard#show", as: 'dashboard'
  get "/dashboard/download_schedule", to: "dashboard#download_schedule", as: "download_schedule" #, format: 'csv'
    
  get '/t/:slug', to: 'links#show_profile'
  
  get '/:profile_name', to: "profiles#show", as: 'profile'
    
  resources :user_friendships
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
