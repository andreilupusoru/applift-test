Applift::Application.routes.draw do
  devise_for :users
  
  match "/gadgets/index" => "gadgets#index", :via=>[:post]
  resources :gadgets
  resources :gadget_images

  match "/gadgets/upload/:id" => "gadgets#upload", :via=>[:post]

  root "gadgets#index"


end
