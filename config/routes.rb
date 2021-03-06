Rails.application.routes.draw do

  get 'my/posts'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'login',  to: 'users/sessions#new'
    get 'logout',  to: 'users/sessions#destroy'
    get 'signup', to: 'users/registrations#new'
  end

  resource :my, controller: 'my' do
    get :posts
  end

  get    '/char/:id',   to: 'japanese_syllabary#view', as: 'char'

  match  '/:id',        to: 'card#view', via: 'get', constraints: { id: /[0-9]+/ }, as: 'card'
  get    '/post',       to: 'card#post'
  post   '/post',       to: 'card#post'
  delete '/delete/:id', to: 'card#delete'
  get    '/edit/:id',   to: 'card#edit'

  get '/', to: 'top#index', as: 'root'

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
