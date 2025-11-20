class Admin::GamesController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to admin_game_path(@game), notice: "ゲームを登録しました。"
    else
      flash.now[:alert] = "ゲームの登録に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to admin_game_path(@game), notice: "ゲーム情報を更新しました。"
    else
      flash.now[:alert] = "ゲーム情報の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    if @game.destroy
      redirect_to admin_games_path, notice: "ゲームを削除しました。"
    else
      flash.now[:alert] = "ゲーム情報の削除に失敗しました。"
      render :edit
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:game_name, :synopsis, :release_date)
  end
end
