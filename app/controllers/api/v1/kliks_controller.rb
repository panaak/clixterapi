module Api::V1
  class KliksController < ApplicationController
    before_action :set_klik, only: :klik

    # POST /api/v1/klik
    def klik
      team = @klik.team
      team_clicks = team.kliks.size
      session_clicks = team.kliks.where(session: params[:session]).size
      render json: { team_clicks: team_clicks, your_clicks: session_clicks }
    end

    # GET /api/v1/leaderboard
    def leaderboard
      teams = []
      Team.all.select('teams.name as team, teams.kliks_count as clicks').each_with_index do |team, index|
        order = index + 1
        teams.push order: order, team: team.team, clicks: team.clicks
      end

      render json: teams
    end

    private

    def set_klik
      team = Team.find_or_create_by(name: params[:team])
      render json: team.errors, status: :unprocessable_entity and return unless team.valid?

      @klik = team.kliks.create(session: params[:session])
      render json: @klik.errors, status: :unprocessable_entity unless @klik.valid?
    end
  end
end
