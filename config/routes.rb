Werstreikt::Application.routes.draw do
  resources :users do
    collection do
      get :login_with_facebook
      get :logout
    end
  end
  resources :strikes
  root :to => "home#index"
end
