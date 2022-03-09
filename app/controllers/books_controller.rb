class BooksController < ApplicationController


  def index
    @books = Book.all
    @book = Book.new

  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    @book.save
    # showの画面へリダイレクト
    redirect_to 'books#show'

  end

  def show
  end

  def edit
  end
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
