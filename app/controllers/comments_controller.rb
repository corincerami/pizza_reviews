class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.review = @review

    if @comment.save
      redirect_to review_path(@review),
                  notice: "Comment has been posted sucessfully"
    else
      render "reviews/show"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
     redirect_to review_path(@comment.review),
                 notice: "Comment has been updated"
    else
      render :edit
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
