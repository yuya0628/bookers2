class UsersController < ApplicationController

before_action :authenticate_user!

  def show
    @user=User.find(params[:id])
    @books=@user.books.all
    # current_userの新規投稿画面を埋め込む(vierのform_withのmdel:の部分にcurrent_userの文字を直接入れれなさそうだからここでは変数を定義している)
    @book=current_user.books.new
  end

  def index
    @users=User.all
    # current_userの新規投稿画面を埋め込む(vierのform_withのmdel:の部分にcurrent_userの文字を直接入れれなさそうだからここでは変数を定義している)
    @book=current_user.books.new
    # これ書かなくてもviewに直接current_userメソッド書いてcurrent_userの情報を引き出すことができる
    # @user=User.find(current_user.id)
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if  @user.update(user_params)
        flash[:notice] = "You have updated user successfully."
        redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)

  end
end
