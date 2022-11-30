class AuthorsController < ApplicationController
  def index
    @Authors = Author.all
  end
end