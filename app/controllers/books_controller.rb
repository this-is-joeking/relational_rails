class BooksController < ApplicationController
  def index
    @Books = Book.all
  end
end