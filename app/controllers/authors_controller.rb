class AuthorsController < ApplicationController
  def index
    @Authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def books
    @author = Author.find(params[:id])
    @books = Book.where(author_id: @author.id)
  end
end