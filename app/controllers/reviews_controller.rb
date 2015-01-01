class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @review = Review.find(params[:id])
    @pizzeria = Pizzeria.find(@review.pizzeria_id)
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
      redirect_to pizzeria_review_path(@pizzeria, @review)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @pizzeria = Pizzeria.find(@review.pizzeria_id)
    if !correct_user?
      flash[:error] = "You do not have permission to edit this review"
      render :show
    end
  end

  def update
    @review = Review.find(params[:id])
    @pizzeria = Pizzeria.find(@review.pizzeria_id)
    if correct_user? && @review.update(review_params)
      flash[:notice] = "Review Updated Sucessfully"
      redirect_to pizzeria_review_path(@pizzeria, @review)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end

  def correct_user?
    current_user == @review.user
  end
end