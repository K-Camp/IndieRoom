class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました。"
      redirect_to my_page_path
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:score, :title, :body)
  end
end
