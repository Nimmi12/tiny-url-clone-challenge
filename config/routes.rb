Rails.application.routes.draw do
  root 'shortened_urls#index'
  resources :shortened_urls
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
