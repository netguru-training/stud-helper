Rails.application.routes.draw do
  #devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", authorization: "users/authorization" }

  devise_for :users, controllers: {
                       omniauth_callbacks: 'users/omniauth_callbacks',
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                   }

  devise_scope :user do
    resources :users, only: [:show, :update, :create] do
      get :new_from_omniauth, controller: 'users/registrations', on: :collection
      post :create_from_omniauth, controller: 'users/registrations', on: :collection
    end
  end

  resources :professors do
    resources :comments
  end

  get 'professors/:id/upvote' => 'professors#upvote', as: :upvote_professor
  get 'professors/:id/downvote' => 'professors#downvote', as: :downvote_professor

  resources :subjects do
    resources :subject_items do

    end
  end

  root to: 'visitors#index'

  resources :users

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
