class UpvotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @upvote = @review.upvotes.build(user: current_user)
    if @upvote.save
      flash[:notice] = "Vote recorded"
      redirect_to review_path(@review)
    else

    end
  end
end
