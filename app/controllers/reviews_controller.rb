class ReviewsController < ApplicationController
	def show
		@review = Review.find(params[:id])
		@pizzeria = Pizzeria.find(@review.pizzeria_id)
		@comment = Comment.new
	end
end
