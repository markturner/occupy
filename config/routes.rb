Occupy::Application.routes.draw do
  root :to => "camps#index"
  resources :camps do
    post :find, :on => :collection
  end
end
