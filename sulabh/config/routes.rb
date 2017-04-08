Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :sulabh_policy_claims
  resources :sulabh_policies
  resources :sulabh_financials
  resources :sulabh_loan_confirms
  resources :sulabh_req_offer_maps
  resources :sulabh_offer_statuses
  resources :sulabh_request_statuses
  resources :sulabh_loan_offers
  resources :sulabh_loan_requests
  resources :sulabh_user_roles
  resources :sulabh_roles
  resources :sulabh_users
  resources :sulabh_user_profiles
  resources :sulabh_passwords
  resources :sulabh_addresses
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
get 'api_check', :to => 'say#hello'  
end
