Ruleperfect::Application.routes.draw do
  resources :rules
  resources :posts
  
  root 'posts#new'
  
  get   'posts/new/:topic',to: 'posts#new', as: :topic
  get   'rules/:subject',to: 'rules#index', as: :subject
end
