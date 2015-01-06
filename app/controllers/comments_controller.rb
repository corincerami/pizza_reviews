class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @vote = Vote.new
    @comment.user = current_user
    @comment.review = @review
    if @comment.save
      redirect_to review_path(@review),
                  notice: "Comment has been posted sucessfully"
    else
      render "reviews/show"
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
