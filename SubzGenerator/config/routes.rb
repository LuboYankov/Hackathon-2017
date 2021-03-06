Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  root 'welcome#index'

  get '/file_upload/index', to: 'file_upload#index'
  post '/file_upload/index', to: 'file_upload#create'
  get 'download_srt/download_subtitles'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
