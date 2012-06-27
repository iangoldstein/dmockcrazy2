class VoteController < ApplicationController

  before_filter :authenticate_user! #users only

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
    current_user.vote = @vote

    respond_to do |format|
      format.html { redirect_to results_path, notice: 'Your vote was recorded!' }
      format.json { render json: vote }
    end
  end
end

