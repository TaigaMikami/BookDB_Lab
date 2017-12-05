class BooksController < ApplicationController
  require 'googlebooks'

  def index
    @books = Book.paginate(page: params[:page], per_page: 16)
    @books_count = Book.all.count
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
      flash[:success] = "Add New Books"
      redirect_to @book
    else
      render 'new'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book deleted"
    redirect_to books_url
  end

  def search
    @books = Book.where('title LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.json { render 'index', json: @books }
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description,
                                   :isbn, :publishdate, :image_name)
    end
end
