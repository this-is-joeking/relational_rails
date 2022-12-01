class BooksController < ApplicationController
  def index
    @Books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
end