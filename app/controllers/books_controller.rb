class BooksController < ApplicationController
  #@モデル名（:id）で1つののデータを持ってくるから
  def show
    @book = Book.find(params[:id])
  end
  #@モデルの複数形（.all）で複数のデータを持ってくるから
  #@モデル＝モデル.newで投稿を保存できる
  def index
    @book = Book.new
    @books = Book.all
   
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save  
      flash[:notice] = "successfully create"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully update"
      redirect_to book_path(@book)
    else
      render  :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy          
    flash[:notice] = "successfully destroy"
    redirect_to books_path    
  end


  
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
