class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end
  
  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    byebug
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to recipes_path
  end

  private 

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end

end