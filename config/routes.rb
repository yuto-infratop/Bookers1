Rails.application.routes.draw do
  resources :books
  root :to => 'books#top'
  get "books" =>"books#index"
  post "books/create" => "books#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
