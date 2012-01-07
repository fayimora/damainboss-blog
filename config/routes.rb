Blog::Application.routes.draw do
     root :to => 'post#show'
     match 'post' => 'post#show'
     get "post/new"
     get "post/edit"
     get "post/show"
     get "post/delete"
     # get "post/create"

end
