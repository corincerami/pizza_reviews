class PizzeriasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @pizzeria = Pizzeria.new
  end

  def create
    @pizzeria = Pizzeria.new(pizzeria_params)
    if @pizzeria.save
      flash[:notice] = "Pizzeria created"
      redirect_to pizzeria_path(@pizzeria)
    else
      render :new
    end
  end

  def show
    @pizzeria = Pizzeria.find(params[:id])
  end

  def index
    if params[:query]
      @pizzerias = Pizzeria.search(params[:query])
      if @pizzerias.empty?
        flash[:notice] = "No results found"
      else
        flash[:notice] = "#{@pizzerias.size}" +
                         "#{"pizzeria".pluralize(@pizzerias.size)} found!"
      end
    else
      @pizzerias = Pizzeria.all
    end
  end

  def edit
    @pizzeria = Pizzeria.find(params[:id])
  end

  def update
    @pizzeria = Pizzeria.find(params[:id])
    if @pizzeria.update(pizzeria_params)
      flash[:notice] = "Pizzeria updated"
      redirect_to pizzeria_path(@pizzeria)
    else
      render :edit
    end
  end

  def destroy
    @pizzeria = Pizzeria.find(params[:id])
    if @pizzeria.destroy
      flash[:notice] = "Pizzeria Deleted"
      redirect_to pizzerias_path
    else
      render :show
    end
  end

  private

  def pizzeria_params
    params.require(:pizzeria).permit(:name, :street, :city, :state,
                                     :zip_code, :phone, :website, :photo)
  end
end
