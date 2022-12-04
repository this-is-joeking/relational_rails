class BooksController < ApplicationController
  def index
    @Books = Book.only_audio_books
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id]) 
  end

  def update
    book = Book.find(params[:id]) 
    book.update(book_params)
    redirect_to "/books/#{ book.id }"
  end

private
def book_params
  cleansed_params = params.permit(:name, :available_as_audiobook, :page_length, :genre).to_h
  cleansed_params.select { |_key, value| !value.empty? }
end
end