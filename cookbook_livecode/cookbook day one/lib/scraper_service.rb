#dependencies?
require 'open-uri' # get html from the web
require 'nokogiri' # parse html
require 'pry-byebug'

class ScraperService
  def initialize
    @base_url = "https://www.allrecipes.com/search/results/?wt="
  end

  def call(query)
    html_doc = open(@base_url + query)
    html_nodes = Nokogiri::HTML(html_doc)
    html_nodes.search(".fixed-recipe-card").first(5).map do |card_node|
      title = card_node.search('span.fixed-recipe-card__title-link').text.strip
      description = card_node.search('.fixed-recipe-card__description').text.strip
      recipe_url = card_node.search('.fixed-recipe-card__h3 > a').attribute('href').value
    {name: title, description: description, recipe_url: recipe_url}
    end
  end

  def get_prep_time_for(recipe_url)
    html_doc = open(recipe_url)
    html_nodes = Nokogiri::HTML(html_doc)
    prep_time = html_nodes.search('.recipe-meta-item-body')[0].text.strip.match(/\d+/).to_s.to_i
  end
end
