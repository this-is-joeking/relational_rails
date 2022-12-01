class AuthorsController < ApplicationController
  def index
    @Authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end
end