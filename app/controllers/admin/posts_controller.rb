class Admin::PostsController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_post, only: [:show, :publish, :unpublish]

  def show
    @comments = @post.comments
                     .includes(:user)
                     .order(created_at: :desc)
                     .page(params[:page])
                     .per(20)
  end

  def publish
    @post.update(is_public: true)
    redirect_to admin_post_path(@post), notice: "公開状態に変更しました。"
  end

  def unpublish
    @post.update(is_public: false)
    redirect_to admin_post_path(@post), notice: "非公開に変更しました。"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:game_id, :score, :post_title, :content)
  end
end
