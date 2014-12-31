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
		@review = Review.new(review_params)
		@review.pizzeria_id = @pizzeria.id
		@review.user_id = current_user.id
		if @review.save
			flash[:notice] = "Review created"
			redirect_to pizzeria_review_path(@pizzeria, @review)
		else
			render :new
		end

	end
	
	private

	def review_params
		review_params = params.require(:review).permit(:title, :body, :rating, :pizzeria_id)
	end
end
