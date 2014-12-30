class PizzeriasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @pizzeria = Pizzeria.new
  end

  def create
    @pizzeria = Pizzeria.new(pizzeria_params)
    if @pizzeria.save
      flash[:notice] = 'Pizzeria created'
      redirect_to pizzeria_path(@pizzeria)
    else
      render "new"
    end
  end

  def show
    @pizzeria = Pizzeria.find(params[:id])
  end

  def index
    @pizzerias = Pizzeria.all
  end

  private

  def pizzeria_params
    params.require(:pizzeria).permit(:name, :street, :city, :state, :zip_code, :phone, :website)
  end
end
