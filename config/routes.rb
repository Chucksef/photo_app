Rails.application.routes.draw do
	get 'site_items/index'
	get 'site_items/new'
	get 'site_items/show'
	get 'site_items/edit'
	get 'password_resets/new'
	get 'password_resets/edit'


	#Root
	root 'routes#root'


	#Users
	resources :users, except: :new 
	get '/signup', to: "users#new"


	#Sessions
	get '/login', to: "sessions#new"
	post '/login', to: "sessions#create"
	delete '/logout', to: "sessions#destroy"

	
	#Activations
	resources :account_activations, only: [:edit]

	
	#Resets
	resources :password_resets, only: [:new, :create, :edit, :update]

	#SiteItems
	resources :site_items, only: [:index, :show, :edit] do
		member do
			delete :delete_image_attachment
			get :move_image_attachment
		end
	end
	resources :tmp_groups, controller: :site_items, type: "TmpGroup", except: [:index, :show, :edit]
	resources :tmp_articles, controller: :site_items, type: "TmpArticle", except: [:index, :show, :edit]
	resources :tmp_galleries, controller: :site_items, type: "TmpGallery", except: [:index, :show, :edit]
	resources :tmp_cards, controller: :site_items, type: "TmpCard", except: [:index, :show, :edit]

end
