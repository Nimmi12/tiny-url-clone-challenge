Rails.application.routes.draw do
  get 'visitors/index'
  root 'shortened_urls#index'
  resources :shortened_urls, shallow: true do
    resources :visitors, only: %i[index]
  end
end
