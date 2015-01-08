module Admin
  class PizzeriasController < ApplicationController
    before_filter :authorize!
    def index
      @pizzerias = Pizzeria.all
    end
  end
end
