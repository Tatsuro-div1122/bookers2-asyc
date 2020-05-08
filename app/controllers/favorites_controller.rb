class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: params[:book_id])
    favorite.save
    render 'favorite'
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    favorite.destroy
    render 'favorite'
  end

end
