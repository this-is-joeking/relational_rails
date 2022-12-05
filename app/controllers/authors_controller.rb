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

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(author_params)
    redirect_to "/authors/#{params[:id]}"
  end

  def destroy
    Author.find(params[:id]).destroy
    redirect_to "/authors"
  end

private
  def author_params
    cleansed_params = params.permit(:name, :living, :location, :years_active).to_h
    cleansed_params.select { |_key, value| !value.empty? }
  end
end