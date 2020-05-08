class SearchController < ApplicationController

  def index
    @user_or_book = params[:option]
    @how_search = params[:choice]
    if @user_or_book == "1"
      @users = User.search(params[:search], @user_or_book, @how_search)
      render 'users/index'

    else
      @books = Book.search(params[:search], @user_or_book, @how_search)
      render 'books/index'
    end
  end

end
