class AuthorsController < ApplicationController
  def index
    @Authors = Author.sort_by_created_at
  end

  def show
    @author = Author.find(params[:id])
    @number_of_books = @author.count_books
  end

  def new
  end

  def create
    Author.create(author_params)
    redirect_to '/authors'
  end

private
  def author_params
    params.permit(:name, :living, :location, :years_active)
  end
end