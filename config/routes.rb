RailsDispatch::Application.routes.draw do |map|

  root :to => "posts#home"
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register' }

  # resources :posts, :only => [:welcome, :index]
  match "/posts" => "posts#index", :as => :posts
  match "/posts/:slug" => "posts#show", :as => :post
  match "/posts/feed.:format" => "posts#index"
  
  # match "/posts(/:slug)(/feed.:format)" => "posts#index", :as => :post

  match '/contributors/apply' => 'contributors#apply'
  resources :contributors, :only => [:index, :show]

  match "/about/" => "pages#index", :as => :page_index
  match "/about/:slug" => "pages#show", :as => :page
    
  namespace :community do
    root :to => "community#index"

    resources :questions do
      put :vote, :on => :member
    end

    resources :answers
    
    resources :feeds do
      resources :feed_entries, :only => [:index, :show]
    end
    
  end  
  
  namespace :admin do
    root :to => "admin#index"
    resources :users
    resources :posts
    resources :contributors
    resources :notifications
    resources :pages
    resources :questions

    namespace :community do 
      root :to => "community#index"
      resources :feeds do
        resources :feed_entries
      end
    end
    resources :settings do
      collection do
        put :set
      end
    end
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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
