module Admin
  class CommentsController <ApplicationController
  before_filter :authorize!
    def index
      @comments = Comment.all
    end
  end
end
