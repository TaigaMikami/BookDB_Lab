class BooksController < ApplicationController
  require 'googlebooks'

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)    # 実装は終わっていないことに注意!
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description,
                                   :isbn, :publishdate, :image_name)
    end
end
