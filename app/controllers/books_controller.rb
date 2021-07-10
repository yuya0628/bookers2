class BooksController < ApplicationController

 before_action :authenticate_user!

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
       flash[:notice]="You have created book successfully."
       redirect_to book_path(@book)
    else
       @books=Book.all
       render :index
    end
  end

  def show
    @book=Book.find(params[:id])
    # @user=@book.user.find(@book.user_id) 　エラーになる
  end

  def index
    @book=Book.new
    @books=Book.all
# current_userのマイページ情報をBookのuser_idから引き出したい
    # @bookk=Book.find(current_user.id)　　記事を投稿してない人（＝記事のid）を持たない人の場合、エラーになる
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
      @book=Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book)
    else
      @books=Book.all
       render :index
    end
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
