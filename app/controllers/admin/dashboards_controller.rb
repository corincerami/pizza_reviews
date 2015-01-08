module Admin
  class DashboardsController < ApplicationController
    before_filter :authorize!
    def index
    end
  end
end
