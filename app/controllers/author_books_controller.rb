class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:id])
    @books = Book.where(author_id: @author.id)
    # @books = @author.books
    if params[:sort]
      @books = @books.sort_alphabetically
    end

    if params[:page_length]
      @books = @books.page_limit(params[:page_length])
    end
  end

  def new
    @author = Author.find(params[:id])
  end

  def create
    author = Author.find(params[:id])
    author.books.create(book_params)
    redirect_to "/authors/#{ author.id }/books"
  end

  private
  def book_params
    cleansed_params = params.permit(:name, :available_as_audiobook, :page_length, :genre).to_h
    cleansed_params.select { |_key, value| !value.empty? }
  end
end