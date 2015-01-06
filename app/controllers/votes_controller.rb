class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    vote = @review.votes.find_or_initialize_by(user: current_user)
    vote.assign_attributes(vote_params)
    if vote.save
      flash[:notice] = "Vote recorded"
      redirect_to review_path(@review)
    else
      flash[:notice] = "Could not save vote"
      render review_path(@review)
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end
end
