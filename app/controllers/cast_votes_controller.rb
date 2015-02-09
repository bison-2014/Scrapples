class CastVotesController < ApplicationController
  respond_to :html, :js

  def create
    @card = Card.find_by(id: params[:card_id])
    vote = CastVote.create(cast_vote_params)
    @success = vote.valid?
  end

  private

  def cast_vote_params
    params.permit(:voter_id, :play_id)
  end

end