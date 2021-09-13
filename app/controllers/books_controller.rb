class BooksController < ApplicationController
  #@モデル名（:id）で1つののデータを持ってくるから
  def show
    @book = Book.find(params[:id])
  end
  #@モデルの複数形（.all）で複数のデータを持ってくるから
  #@モデル＝モデル.newで投稿を保存できる
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # ３. トップ画面へリダイレクト
    redirect_to book_path(book.id)
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end
  
  def destroy
    book = Book.find(params[:id])
    
  end


  
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
