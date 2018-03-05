Rails.application.routes.draw do
  resources :sales, only: %i[index new create]
  root 'sales#index'
end
