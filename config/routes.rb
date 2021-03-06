SiomaraSierra::Application.routes.draw do
  get "static_pages/help"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  match 'contact',       to: 'contact#new',                via: 'get'
  match 'contact',       to: 'contact#create',             via: 'post'
  match '/',             to: 'static_pages#create',        via: 'post'
  match 'kids',          to: 'static_pages#kids',          via: 'get'
  match 'ninos',         to: 'static_pages#ninos',         via: 'get'
  match 'damas',         to: 'static_pages#damas',         via: 'get'
  match 'deeply_inlove', to: 'static_pages#deeply_inlove', via: 'get'  
  match '/profundamente_enamorada', to: 'static_pages#profundamente_enamorada', via: 'get'
  
  # You can have the root of your site routed with "root"
  scope "(:locale)", :locale => /es|en/ do
    root :to => 'static_pages#home'
    get "static_pages/home"
  end
  

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
