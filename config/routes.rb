Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/authors', to: 'authors#index'
  get '/authors/:id', to: 'authors#show'
  # get '/authors/:id/books', to: 'authors#books'
  get '/authors/:id/books', to: 'author_books#index'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
end
