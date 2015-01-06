class VotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @vote = @review.votes.build(vote_params)
    @vote.user = current_user
    if @vote.save
      flash[:notice] = "Vote recorded"
      redirect_to review_path(@review)
    else
      render review_path(@review)
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:value)
  end
end
