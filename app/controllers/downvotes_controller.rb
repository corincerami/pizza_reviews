class DownvotesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @downvote = @review.downvotes.build(user: current_user)
    if @downvote.save
      flash[:notice] = "Vote recorded"
      redirect_to review_path(@review)
    else

    end
  end
end
