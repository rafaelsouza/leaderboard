class GamesController < ApplicationController
  before_action :set_league
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = @league.games
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @players = @league.players
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
    @players = @league.players
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.league_id = params[:league_id]
    @players = @league.players
    respond_to do |format|
      if @game.process
        format.html { redirect_to @league, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    @players = @league.players
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @league, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:home_player_id, :away_player_id, :home_score, :away_score)
    end

    def set_league
      @league = League.find params[:league_id]
    end
end
