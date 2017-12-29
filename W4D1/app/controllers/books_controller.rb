class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all 
  end

  def new
    # your code here
  end

  def create
    # your code here
    book = Book.new(book_params)
    if book.save
    else
      flash[:notice] = book.errors.full_messages
    end
    redirect_to '/books'
  end

  def destroy
    # your code here
    Book.find(params[:id]).destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
