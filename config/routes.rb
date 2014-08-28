Rails.application.routes.draw do
  devise_for :users, skip: [:registration], controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#home'

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

  namespace :admin do
    resources :lates, only: [:index, :new, :create, :edit, :update]
    resources :feedbacks, only: [:index]
    resources :leaves do
      member do
        patch 'approve'
        get 'reject'
        patch 'reject_action'
      end
    end
    resources :staffs do
      resources :leaves, only: [:index], controller: 'staffs/leaves'
    end
  end

  resources :leaves, only: [:index, :new, :create, :show]
  resources :staffs, only: [:show]
  resources :feedbacks, only: [:new, :create]

  get 'my-account' => 'staffs#show'

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
