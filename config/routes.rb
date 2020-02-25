Rails.application.routes.draw do
  	get 'sites/edit'
  	get 'sites/update'
	get 'pages/index'
	get 'pages/new'
	get 'pages/show'
	get 'pages/edit'
	get 'password_resets/new'
	get 'password_resets/edit'


	#Root
	root 'routes#root'


	#Users
	resources :users, except: [:new, :show ]
	get '/signup', to: "users#new"


	#Sessions
	get '/login', to: "sessions#new"
	post '/login', to: "sessions#create"
	delete '/logout', to: "sessions#destroy"

	
	#Activations
	resources :account_activations, only: [:edit]

	
	#Resets
	resources :password_resets, only: [:new, :create, :edit, :update]

	
	#Pages
	resources :pages, only: [:index, :show, :edit] do
		member do
			delete :delete_image_attachment
		end
	end
	
	patch '/pages/:id/increment', to: "pages#increment", as: 'increment_pages'
	patch '/pages/:id/decrement', to: "pages#decrement", as: 'decrement_pages'

	resources :tmp_groups, controller: :pages, type: "TmpGroup", except: [:index, :show, :edit]
	resources :tmp_articles, controller: :pages, type: "TmpArticle", except: [:index, :show, :edit]
	resources :tmp_galleries, controller: :pages, type: "TmpGallery", except: [:index, :show, :edit]
	resources :tmp_cards, controller: :pages, type: "TmpCard", except: [:index, :show, :edit]
	resources :tmp_splashes, controller: :pages, type: "TmpSplash", except: [:index, :show, :edit]


	#Site
	get '/options', to: "sites#edit"
	patch '/options', to: "sites#update"
end
