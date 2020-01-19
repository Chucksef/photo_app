Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  get '/contact', to: "static_pages#contact"
  get '/about', to: "static_pages#about"
  get '/home', to: "static_pages#home"

  resources :galleries do
    member do
      delete :delete_image_attachment
      get :move_image_attachment
    end
  end

end
