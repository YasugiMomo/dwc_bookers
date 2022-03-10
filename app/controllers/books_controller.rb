class BooksController < ApplicationController


  def index
    @books = Book.all
    @book = Book.new

  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @book.save
    # showの画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
     # データ（レコード）を1件取得
    book = Book.find(params[:id])
    # データ（レコード）を削除
    book.destroy
    # 投稿一覧画面へリダイレクト
    redirect_to '/books'
  end

  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
