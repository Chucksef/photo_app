Rails.application.routes.draw do


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

end
