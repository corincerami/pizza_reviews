module Admin
  class ReviewsController <ApplicationController
  before_filter :authorize!
    def index
      @reviews = Review.all
    end
  end
end
