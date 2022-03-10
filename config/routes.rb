Rails.application.routes.draw do
  # get 'books/index'
  get 'books/:id' => 'books#show', as: 'book'
  # get 'books/edit'
  get '/' => 'homes#top'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
