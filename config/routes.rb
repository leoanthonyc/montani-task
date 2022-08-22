Rails.application.routes.draw do
  get 'books/:id', to: 'books#show'
  get 'isbn/:isbn/toggle', to: 'isbn#toggle'
end
