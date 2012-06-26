class VoteController < ApplicationController
  # GET /vote
  # GET /vote.json
  def index
    @candidates = Candidate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidates }
    end
  end

  def submit
    #candidate = Candidate.find(params[:id])
    @vote = Vote.new

    @candidate = Candidate.find(params[:id])
    @vote = @candidate.votes.create

    respond_to do |format|
      format.html { redirect_to results_path, notice: 'Your vote was recorded!' }
      format.json { render json: vote }
    end
  end
end

