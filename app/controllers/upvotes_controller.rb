class UpvotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @upvote = @review.upvotes.build(user: current_user)
    if current_user.has_downvoted?(@review) && @upvote.save
      downvote = current_user.downvotes.find_by(review: @review)
      downvote.destroy
      flash[:notice] = "New vote recorded"
      redirect_to review_path(@review)
    elsif @upvote.save
      flash[:notice] = "Vote recorded"
      redirect_to review_path(@review)
    else
      render "reviews#show"
    end
  end
end
