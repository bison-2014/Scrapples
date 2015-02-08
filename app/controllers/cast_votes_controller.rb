class CastVotesController < ActiveController::Base


  def create
    appearance = Appearance.find(params[:appearance_id])
    appearance.round.castvote.create
  end
end