Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  resources :books do
    collection do
      get 'search'
    end
  end

end
