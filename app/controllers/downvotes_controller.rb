class DownvotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @downvote = @review.downvotes.build(user: current_user)
    if current_user.has_upvoted?(@review) && @downvote.save
      upvote = current_user.upvotes.find_by(review: @review)
      upvote.destroy
      flash[:notice] = "New vote recorded"
      redirect_to review_path(@review)
    elsif @downvote.save
      flash[:notice] = "Vote recorded"
      redirect_to review_path(@review)
    else
      render "reviews#show"
    end
  end
end
