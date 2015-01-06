class VotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @vote = @review.votes.build(vote_params)
    @vote.user = current_user
    if current_user.has_voted?(@review) && @vote.save
      old_vote = current_user.votes.find_by(review: @review)
      old_vote.destroy
      flash[:notice] = "Vote updated"
      redirect_to review_path(@review)
    elsif @vote.save
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
