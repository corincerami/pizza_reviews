module Admin
  class ReviewsController < ApplicationController
    before_filter :authorize!
    def index
      @reviews = Review.all
    end

    def destroy
    @review = Review.find(params[:id])
      if @review.destroy
        flash[:notice] = "Review deleted"
        redirect_to admin_reviews_path
      else
        render :show
      end
    end
  end
end
