Occupy::Application.routes.draw do
  root :to => "camps#index"
  resources :camps
end
