Blog::Application.routes.draw do
  root :to => 'posts#show'
  match 'posts' => 'posts#show'
  get "posts/new"
  get "posts/edit"
  get "posts/show"
  get "posts/delete"
  # get "posts/create"
end
