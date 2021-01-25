require 'colorize'

class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      if recipe.done?
        puts "#{index + 1}. #{recipe.name}: #{recipe.description} - #{recipe.prep_time}".colorize(:green)
      else
        puts "#{index + 1}. #{recipe.name}: #{recipe.description} - #{recipe.prep_time}".colorize(:blue)
      end
    end
  end

  def display_imported(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. #{recipe[:name]}: #{recipe[:description]}"
    end
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    print "> "
    return gets.chomp.to_i - 1
  end
end
