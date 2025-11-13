class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @games = Game.all
  end

  def create
    @post = current_user.posts.new(post_params)
    @games = Game.all
    if @post.save
      flash[:notice] = "レビューを投稿しました。"
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "投稿に失敗しました。入力内容を確認してください。"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "レビューを更新しました。"
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = "更新に失敗しました。入力内容を確認してください。"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "レビューを削除しました。"
    else
      flash[:alert] = "削除に失敗しました。"
    end
    redirect_to user_path(current_user)
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:game_id, :score, :post_title, :content)
  end
end
