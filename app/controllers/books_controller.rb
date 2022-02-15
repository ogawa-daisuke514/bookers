class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: "A book was successfully created."
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def update
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    @message =
    @books = Book.all
    @book = Book.new
    # render :index
    redirect_to books_path, notice: "A book was successfully deleted."
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
