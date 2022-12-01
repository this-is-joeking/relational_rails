class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:id])
    @books = Book.where(author_id: @author.id)
  end
end