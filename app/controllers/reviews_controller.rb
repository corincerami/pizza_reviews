class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    @vote = Vote.new
  end

  def new
    @pizzeria = Pizzeria.find(params[:pizzeria_id])
    @review = Review.new
  end

  def create
    @pizzeria = Pizzeria.find(params[:pizzeria_id])
    @review = @pizzeria.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review created"
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def edit
    @review = current_user.reviews.find(params[:id])
    @pizzeria = @review.pizzeria
  end

  def update
    @review = current_user.reviews.find(params[:id])
    @pizzeria = @review.pizzeria
    if @review.update(review_params)
      flash[:notice] = "Review Updated Sucessfully"
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review = current_user.reviews.find(params[:id])
    if @review.destroy
      flash[:notice] = "Review deleted"
      redirect_to pizzeria_path(@review.pizzeria)
    else
      render :show
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating, :photo)
  end
end
