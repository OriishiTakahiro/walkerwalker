Rails.application.routes.draw do

  resources :qrlogs

  resources :steplogs

  resources :gpsquests

  resources :gpslogs

  resources :items

  resources :users

	#for android client
	get 'api/test' => 'api#test_api'
	get 'api/list' => 'api#get_list'
	get 'api/get/get_userhash' => 'api#getUserhash'
	get 'api/get/get_step' => 'api#getStep'
	get 'api/get/get_gps_questlist' => 'api#getGpsQuestList'

	post 'api/post/register_user' => 'api#registerUser'
	post 'api/post/post_step' => 'api#addStep'
	post 'api/post/post_location' => 'api#postLocation'
	post 'api/post/post_qr_code' => 'api#postQRcode'

	#for administrator
	post 'api/admin/new_lotrate' => 'api#newLotRate'
	post 'api/admin/new_gpsquest' => 'api#newGpsQuest'
	post 'api/admin/new_qrevent' => 'api#newQRevent'

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
