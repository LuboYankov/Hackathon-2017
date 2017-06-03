Rails.application.routes.draw do
  devise_for :users
  
  get '/file_upload/index', to: 'file_upload#index'
  post '/file_upload/index', to: 'file_upload#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
