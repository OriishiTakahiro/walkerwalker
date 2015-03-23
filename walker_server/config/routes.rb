Rails.application.routes.draw do

  resources :items

  resources :qrevents

  resources :items_users

  resources :gpsquests

  resources :qrlogs

  resources :steplogs

  resources :gpslogs

  resources :users

	#for sensor app
	get '/walker/sensor/gpsquests/get_questlist' => 'sensor_api#getGpsQuestList'
	post '/walker/sensor/steps/post_step' => 'sensor_api#postStep'
	post '/walker/sensor/gpsquests/post_location' => 'sensor_api#postLocation'
	post '/walker/sensor/qrcodes/post_qrcode' => 'sensor_api#postQRcode'

	#for unity game
	get '/walker/game/items/get_items_entity' => 'game_api#getItemEntity'
	get '/walker/game/steps/get_step' => 'game_api#getStep'
	get '/walker/game/steps/post_step' => 'game_api#postStep'
	get '/walker/game/items/post_items' => 'game_api#postItems'

	#for both app

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
