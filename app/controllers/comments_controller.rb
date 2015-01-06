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

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to review_path(@comment.review),
                  notice: "Comment has been updated"
    else
      render :edit
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    if @comment.destroy
      redirect_to review_path(@comment.review),
                  notice: "Comment has been deleted"
    else
      flash[:notice] = "Comment could not be deleted"
      render "reviews/show"
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
