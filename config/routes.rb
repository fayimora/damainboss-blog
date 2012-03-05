Blog::Application.routes.draw do

  #match "*path", to: redirect("http://www.google.co.uk")
  resources :posts do 
     resources :comments 
  end
  root :to => "posts#index"
end
