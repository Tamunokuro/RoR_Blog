Rails.application.routes.draw do
  get 'users/:author_id/posts', to: 'posts#index', as: 'posts'
  get 'users/:author_id/posts/:post_id', to: 'posts#show', as: 'post'
  post 'users/:author_id/posts', to: 'posts#create', as: 'create_post'

  get 'users/:author_id/posts/:post_id/comments', to: 'comments#index', as: 'comments'
  get 'users/:author_id/posts/:post_id/comments/new', to: 'comments#new', as: 'new_comment'
  get 'users/:author_id/posts/:post_id/comments/:comment_id', to: 'comments#show', as: 'comment'
  post 'users/:author_id/posts/:post_id/comments', to: 'comments#create', as: 'create_comment'


  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
