class BookCommentsController < ApplicationController
  def create
    @post_book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.book_id = @post_book.id
    if @book_comment.save

    else
      @book = Book.new
      render 'books/show'
    end
  end

  def destroy
    # baria_book_comment
    @book = Book.new
    @post_book = Book.find(params[:book_id])
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
    render 'destroy'

  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def baria_book_comment
    comment = BookComment.find(params[:id])
    unless comment.user_id == current_user.id
    redirect_to books_path
    end
  end


end
