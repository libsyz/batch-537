require_relative "view"
require_relative "recipe"
require_relative "scraper_service"
require 'pry-byebug'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @scraper = ScraperService.new
  end

  # USER ACTIONS

  def list
    display_recipes
  end

  def create
    # 1. Ask user for a name (view)
    name = @view.ask_user_for("name")
    # 2. Ask user for a description (view)
    description = @view.ask_user_for("description")
    # 3. Ask user for a prep time (view)
    prep_time = @view.ask_user_for("prep time")
    # 3. Create recipe (model)
    recipe = Recipe.new(name, description, prep_time.to_i)
    # 4. Store in cookbook (repo)
    @cookbook.add_recipe(recipe)
    # 5. Display
    display_recipes
  end

  def destroy
    # 1. Display recipes
    display_recipes
    # 2. Ask user for index (view)
    index = @view.ask_user_for_index
    # 3. Remove from cookbook (repo)
    @cookbook.remove_recipe(index)
    # 4. Display
    display_recipes
  end

  def import
    # ask the user for a query word
    # Go to whatever website has the recipes
    # scrape the recipes
    # show them to the user
    # ask the user to choose a recipe
    # add the chosen recipe to the cookbook
    query = @view.ask_user_for(:query)
    scraped_recipes = @scraper.call(query)
    @view.display_imported(scraped_recipes)
    user_index = @view.ask_user_for_index
    selected = scraped_recipes[user_index - 1]
    prep_time = @scraper.get_prep_time_for(selected[:recipe_url])
    new_recipe = Recipe.new(selected[:name], selected[:description], prep_time)
    @cookbook.add_recipe(new_recipe)
  end


  def mark_as_done
    # display all the recipes to the user
    list
    # ask the user for an index
    index = @view.ask_user_for_index - 1
    # tell the repo to mark a task as done with that index
    @cookbook.mark_as_done(index)
  end

  private

  def display_recipes
    # 1. Get recipes (repo)
    recipes = @cookbook.all
    # 2. Display recipes in the terminal (view)
    @view.display(recipes)
  end
end
