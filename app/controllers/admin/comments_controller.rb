module Admin
  class CommentsController < ApplicationController
    before_filter :authorize!
    def index
      @comments = Comment.all
    end

    def destroy
    @comment = Comment.find(params[:id])
      if @comment.destroy
        redirect_to admin_comments_path,
                    notice: "Comment Deleted"
      else
        render "reviews/show"
      end
    end
  end
end
