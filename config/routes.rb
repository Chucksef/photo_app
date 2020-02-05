Rails.application.routes.draw do
	get 'site_items/index'
	get 'site_items/new'
	get 'site_items/show'
	get 'site_items/edit'
	get 'password_resets/new'
	get 'password_resets/edit'
	#Root
	root 'static_pages#home'


	#Static Pages
	get '/contact', to: "static_pages#contact"
	get '/about', to: "static_pages#about"
	get '/home', to: "static_pages#home"


	#Galleries
	resources :galleries do
		member do
			delete :delete_image_attachment
			get :move_image_attachment
		end
	end


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
	resources :site_items do
		resources :groups, controller: :site_items, type: "Group"
		resources :tmp_articles, controller: :site_items, type: "TmpArticle"
		resources :tmp_galleries, controller: :site_items, type: "TmpGallery"
		resources :tmp_cards, controller: :site_items, type: "TmpCard"
	end

end
