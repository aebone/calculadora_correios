Rails.application.routes.draw do
  
  post 'home/result'
  get 'home/result'

  root 'home#index'

end
