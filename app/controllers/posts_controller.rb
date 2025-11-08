class PostsController < ApplicationController

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:name, :email, :introduction, :role, :is_active)
  end
end
