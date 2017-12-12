class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_dog_options
  before_action :set_ingredient_options, only: [:new, :edit]
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all

  end

  def custom_recipes
    puts "Something I will be able to find on a page with a bunch of other stuff"
    puts params
    @custom_recipes = Recipe.where(dog_id: params[:dog_id])
    @custom_dog = Dog.find(params[:dog_id])
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def set_dog_options
      dogs = Dog.where(user: current_user)
      @dog_options = dogs.collect do |dog|
        [dog.name, dog.id]
      end
    end

    def set_dry_ingredients_options
      dry_ingredients = Ingredients.where(category: "Dry Ingredients")
      @dry_ingredients_options = ingredients.collect do |dry_ingredients|
        [ingredient.name, ingredient.id]
      end
    end

    def set_wet_ingredients_options
      wet_ingredients = Ingredients.where(category: "Wet Ingredients")
      @wet_ingredients_options = ingredients.collect do |wet_ingredients|
        [ingredient.name, ingredient.id]
      end
    end


    def set_ingredient_options
      ingredients = Ingredient.all
      @ingredient_options = ingredients.collect do |ingredients|
        [ingredients.name, ingredients.id]
    end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :dog_id, {:ingredient_ids => []})
    end
end
