Charas::Application.routes.draw do
  root :to => "home#index"

  # Login / Registration
  devise_for :users

  # User profiles
  match "profile/:id" => "profiles#show", :as => :user_profile

  # Resources
  match "resources/search" => "resources#search", :as => :resource_search
  match "resources/favorite/:id" => "resources#favorite", :as => :resource_favorite
  match "resources/unfavorite/:id" => "resources#unfavorite", :as => :resource_unfavorite
  match "resources/category/:id" => "resources#category", :as => :resource_category
  resources :resources

  # Games
  resources :games
  namespace "games" do
    # Screenshots
    match ":id/screenshots" => "screenshots#index", :as => :screenshots
    match "screenshots/:id" => "screenshots#show", :as => :screenshots_show
    match "screenshots/:id/makelogo" => "screenshots#logo", :as => :screenshots_logo
    match ":id/screenshots/create" => "screenshots#create", :via => :post, :as => :screenshots_create
    match "screenshots/destroy/:id" => "screenshots#destroy", :via => :delete, :as => :screenshots_destroy
  end

  # Admin areas
  namespace "admin" do
    root :to => "home#index"
    resources :categories
    resources :users

    # Resource approval
    match "resources/" => "resources#index", :as => :resources
    match "resources/approve/:id" => "resources#approve", :via => :post, :as => :resources_approve
    match "resources/delete/:id" => "resources#delete", :via => :delete, :as => :resources_delete
  end

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
