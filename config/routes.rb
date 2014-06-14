SoccerCup::Application.routes.draw do

  # post "rank_memberships", controller: "leagues"


  get "memberships/new"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root     to: "static_pages#landing"
  get "static_pages/gameboard"
  get "static_pages/about"
  get "static_pages/help"
  get "static_pages/contact"

  get "games/upcoming"
  get "games/dashboard"

  devise_for :users

  resources :users, only: [:show], format: false


  resources :user_scores, only: [:index, :new, :create, :show, :update], format: false

  resources :games, only: [:index, :show], format: false do
    resources :user_scores, only: [:index, :new, :show, :create], format: false
  end

  resources :leagues, only: [:index, :new, :create, :show, :update], format: false do
    resources :memberships, only: [:index, :new, :show, :create], format: false
    collection { post :rank_league_memberships }
  end

  # resources :memberships, only: [:show] do
  #   collection { post :rank_league_memberships }
  # end

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
