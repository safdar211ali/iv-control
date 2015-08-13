Rails.application.routes.draw do

  match 'repselectreceive' => 'received#rep_select', :via => :get, :as => :repselectreceiveg
  match 'repselectreceive' => 'received#rep_select', :via => :post, :as => :repselectreceivep

  match 'repreceive' => 'received#rep_received', :via => :get, :as => :repreceiveg
  match 'repreceive' => 'received#rep_received', :via => :post, :as => :repreceivep


  match 'stockselect' => 'repstock#rep_select', :via => :get, :as => :stockselect

   match 'repstock' => 'repstock#rep_stock', :via => :get, :as => :repstockg

  match 'repstock' => 'repstock#rep_stock', :via => :post, :as => :repstockp

  match 'repselectissue' => 'issued#rep_select', :via => :get, :as => :repselectissueg
  match 'repselectissue' => 'issued#rep_select', :via => :post, :as => :repselectissuep

  match 'repselect' => 'issued#rep_issued', :via => :get, :as => :repselectg
  match 'repselect' => 'issued#rep_issued', :via => :post, :as => :repselectp



  match 'issuedfind' => 'itemlists#issued_by_date_find', :via => :post, :as => :issuedfindp
  match 'issuedfind' => 'itemlists#issued_by_date_find', :via => :get, :as => :issuedfindg


  match 'reorderstock'=> 'reorderable#reorder_stock',:via=>:get,:as=>:reorderstock

  match 'expiredstock'=> 'expired#expired_stock',:via=>:get,:as=>:expiredstock


  match 'single_rep'=>'single_item_rep#single_item_find',:via=>:get,:as=>:single_repg
  match 'single_rep'=>'single_item_rep#single_item_find',:via=>:post,:as=>:single_repp

  get 'cp/index'

  # resources :itemlists
  match 'stock' => 'itemlists#index', :via => :get, :as => :stockg
  match 'stock' => 'itemlists#index', :via => :post, :as => :stockp
  match 'itemexpired' => 'itemlists#itemexpired', :via => :get, :as => :itemexpired



  resources :issuances

  resources :stocks
  match 'newstock' => 'receivings#newstock', :via => :get, :as => :newstock
  match 'receivings/new' => 'receivings#new', :via => :post
  match 'newissue' => 'issuances#newissue', :via => :get, :as => :newissue
  match 'issuances/new' => 'issuances#new', :via => :post
  resources :receivings
  match 'delrece' => 'receivings#destroy',:via=>:get,:as=>:delreceg
  match 'delrece' => 'receivings#destroy',:via=>:post,:as=>:delrecep

  resources :items

  resources :categories
  match 'delcats' => 'categories#destroy',:via=>:get,:as=>:delcatsg
  match 'delcats' => 'categories#destroy',:via=>:post,:as=>:delcatsp
  resources :siteusers
  resources :admins
  devise_for :users
  # resources :Item1s
  # match 'billsearch' => 'billsearch#search',:via=>:get,:as=> :billsearchg
  # match 'billsearch' => 'billsearch#search',:via=>:post,:as=> :billsearchp
  # get 'search' => 'searches#search'
  # post 'search' => 'searches#search'
  # match 'searches' => 'searches#index', :via => :get, :as => :newsearchg
  # match 'searches' => 'searches#index', :via => :post, :as => :newsearchp
  # match 'searches/:id'=>'searches#destroy',:via=>:delete ,:as=>:lgrdel
  # resources :payments
  get 'welcome/index'
  # resources :parties
   match 'datainput' => 'welcome#index',:via=>:get
  root 'cp#index'
  match "staff/logout" => "staff#logout", :via => :get
  match "staff/login" => "staff#login", :via => :all
  match "staff/send_login" => "staff#send_login", :via => :all
  match 'admin' => 'staff#welcome', :via => :get
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
