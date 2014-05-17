Applift::Application.routes.draw do
  devise_for :users
  
  resources :gadgets
  resources :gadget_images



  root "gadgets#index"


end
