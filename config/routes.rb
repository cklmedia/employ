Employ::Application.routes.draw do
  root 'employ_users#new'
  resources :employ_users
end
