class ResultsController < ApplicationController
  def index
    @candidates = Candidate.all

    @total_vote = Vote.count

    #Find out who is in the lead
    @winner = @candidates.first
    @candidates.each do |candidate|
      if candidate.votes.count > @winner.votes.count
        @winner = candidate
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidates }
    end
  end
end
