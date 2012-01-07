Blog::Application.routes.draw do
  resources :posts
  root :to => redirect('/posts')
end
