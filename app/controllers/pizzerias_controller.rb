class PizzeriasController < ApplicationController
  def index
    @pizzerias = Pizzeria.all
  end
end
