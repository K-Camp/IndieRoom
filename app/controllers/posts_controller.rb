class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    # 投稿する際に選択するゲームの取得
    @games = Game.all
  end

  def create
    @post = current_user.posts.new(post_params)
    @games = Game.all
    if @post.save
      redirect_to my_page_path
    else
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
      redirect_to my_page_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end
  
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:game_id, :score, :post_title, :content)
  end
end
