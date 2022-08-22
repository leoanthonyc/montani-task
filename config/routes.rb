Rails.application.routes.draw do
  get 'books', to: 'books#index'
  get 'books/:id', to: 'books#show'
  get 'isbn/:isbn/toggle', to: 'isbn#toggle'

  root to: 'books#index'
end
