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
    Book.create({title: book_params['title'], author: book_params['author']})
    redirect_to '/books'
  end

  def destroy
    # your code here
    raise "something"
    Book.find(params[:id]).destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
