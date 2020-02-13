class DosesController < ApplicationController
  before_action :set_cocktail

  def index
    @doses = Dose.all
  end
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end

    def destroy
      @dose = Dose.new(params[:id])
      @cocktail = @dose.cocktail
      @dose.destroy
      redirect_to cocktails_path(@cocktail)
    end
  end

  private

  def doses_params
    params.require(:dose).permit(:description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
