ActionController::Routing::Routes.draw do |map|
  map.resources :pics

  map.resources :album_photos

  map.resources :albums

  map.resources :users

  map.resource :session

  map.resources :signs

  map.resources :bnotes

  map.resources :anotes

  map.resources :gnotes

  map.resources :manages

  map.resource :manage_session

  map.resources :jobs

  map.resources :sites, :path_prefix=>'/manage'

  map.resources :searches

  map.resources :photos

  map.resources :items
	map.resources :tags
	map.resources :projects, :path_prefix=>'/manage'
  map.resources :projects do |project|
		project.resources :items
	end

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
 map.root  :controller => "welcome",:action=>"home"
 map.about '/about',:controller=>"welcome",:action=>"about"
 map.study '/study',:controller=>"welcome",:action=>"study"
 map.school '/school',:controller=>"welcome",:action=>"school"
 map.gpc   '/gpc',:controller=>"welcome",:action=>"gpc"
 map.career '/career',:controller=>"welcome",:action=>"career"
 map.contact '/contact',:controller=>"welcome",:action=>"contact"
 map.picture '/picture',:controller=>"welcome",:action=>"picture"
 
  #后台管理 See how all your routes lay out with "rake routes"
 map.signup '/manage/signup', :controller => "manages",   :action =>"new"
 map.login  '/manage/',  :controller => 'manage_sessions', :action =>'new'
 map.logout '/manage/logout', :controller => 'manage_sessions', :action =>'destroy'
 #前台user sessions
 map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
 map.signup '/signup', :controller => 'users', :action => 'new'
 map.login '/login', :controller => 'sessions', :action => 'new'
 map.logout '/logout', :controller => 'sessions', :action => 'destroy'


  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
	
end
