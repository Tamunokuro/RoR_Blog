Rails.application.routes.draw do

  #devise
  devise_for :users
  # Defines the root path route ("/")
  root "users#index"

  #posts
  get 'users/:author_id/posts', to: 'posts#index', as: 'posts'
  get 'users/:author_id/posts/new', to: 'posts#new', as: 'new_post'
  get 'users/:author_id/posts/:post_id', to: 'posts#show', as: 'post'
  post 'users/:author_id/posts', to: 'posts#create', as: 'create_post'
  delete 'users/:author_id/posts/:post_id', to: 'posts#destroy', as: 'delete'

  #comments
  get 'users/:author_id/posts/:post_id/comments', to: 'comments#index', as: 'comments'
  get 'users/:author_id/posts/:post_id/comments/new', to: 'comments#new', as: 'new_comment'
  get 'users/:author_id/posts/:post_id/comments/:comment_id', to: 'posts#show', as: 'comment'
  post 'users/:author_id/posts/:post_id/comments', to: 'comments#create', as: 'create_comment'
  delete 'users/:author_id/posts/:post_id/comments/:comment_id', to: 'comments#destroy', as: 'delete_comment'

  #likes
  post 'users/:author_id/posts/:post_id/likes', to: 'likes#create', as: 'create_like'

  #users
  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'

  namespace :api do
    get "/users/:author_id/posts", to: "posts#index", as: "api-user-posts"
    get "/users/:author_id/posts/:post_id/comments", to: "comments#index", as: "api-posts-comment"
    post "/users/:author_id/posts/:post_id/comments/new", to: "comments#create", as: "api-create-comment"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
