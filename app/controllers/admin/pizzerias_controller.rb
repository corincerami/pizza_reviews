module Admin
  class PizzeriasController < ApplicationController
    before_filter :authorize!
    def index
      @pizzerias = Pizzeria.all
    end

    def destroy
    @pizzeria = Pizzeria.find(params[:id])
      if @pizzeria.destroy
        flash[:notice] = "Pizzeria Deleted"
        redirect_to admin_pizzerias_path
      else
        render :show
      end
    end
  end
end
