class AuthorsController < ApplicationController
  def index
    @Authors = Author.sort_by_created_at
  end

  def show
    @author = Author.find(params[:id])
    @number_of_books = @author.count_books
  end
end