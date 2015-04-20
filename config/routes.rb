Ruleperfect::Application.routes.draw do
  get "static_pages/about"
  
  resources :rules
  resources :posts
  
  root 'posts#new'
  # root 'static_pages#home'
  
  get   'posts/new/:topic',to: 'posts#new', as: :topic
  get   'rules/:subject',to: 'rules#index', as: :subject
end
