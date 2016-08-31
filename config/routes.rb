Rails.application.routes.draw do

  get 'listeners/index'

  resources :podcasts do
    resources :resources
  end

  resources :listeners
  
  get 'resources/index'

  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations', shared: 'admins/shared', passwords: 'admins/passwords', confirmations: 'admins/confirmations', unlocks: 'admins/unlocks', mailer: 'admins/mailer' }

  devise_scope :admin do 
    get '/' => 'admins/registrations#index'
  end

    get 'admins/sign_in' =>'podcasts#index'


  # devise_scope :admin do
  #   get 'logout' => 'admins/sessions#destroy'
  # end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'listeners#index'

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