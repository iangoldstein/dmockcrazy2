class ResultsController < ApplicationController
  def index
    @candidates = Candidate.all

    @total_vote = Vote.count

    #Find out who is in the lead
    @winner = @candidates.first
    runner_up = @candidates.second
    @candidates.each do |candidate|
      if candidate.votes.count > @winner.votes.count
        runner_up = @winner
        @winner = candidate
      end
    end
    if @total_vote == 0 or @winner.votes.count == runner_up.votes.count
      @winner = nil
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidates }
    end
  end
end
