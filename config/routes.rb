Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/contents', to: 'contents#index'
  get '/contents/test', to: 'contents#test'
end
