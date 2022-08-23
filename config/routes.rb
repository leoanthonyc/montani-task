Rails.application.routes.draw do
  get 'books', to: 'books#index'
  get 'books/:id', to: 'books#show'
  get 'isbn/:isbn/toggle', to: 'isbn#toggle'
  post 'isbn/search', to: 'isbn#search'

  root to: 'books#index'
end
