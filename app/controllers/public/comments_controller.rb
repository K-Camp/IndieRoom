class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to public_post_path(@post), notice: "コメントを投稿しました"
    else
      redirect_to public_post_path(@post), alert: "コメントを入力してください"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      notice = "コメントを削除しました"
    else
      notice = "削除権限がありません"
    end

    redirect_to public_post_path(@post), notice: notice
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_text)
  end
end
