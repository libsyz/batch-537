require "csv"
require_relative "recipe"
require 'pry-byebug'

class Cookbook
  def initialize(csv_file)
    @recipes = [] # <--- <Recipe> instances
    @csv_file = csv_file
    load_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_to_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_to_csv
  end

  def all
    return @recipes
  end

  def mark_as_done(index)
    # fetch the right recipe and mark it as done
    @recipes[index].mark_as_done!
    save_to_csv
  end

  private

  def load_csv
    binding.pry
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2])
    end
  end

  def save_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      binding.pry
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done?]
      end
    end
  end
end
