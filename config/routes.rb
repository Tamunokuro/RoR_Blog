Rails.application.routes.draw do
  get 'users/:author_id/posts', to: 'posts#index', as: 'posts'
  get 'users/:author_id/posts/:post_id', to: 'posts#show', as: 'post'

  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
