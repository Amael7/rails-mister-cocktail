require 'open-uri'

puts 'destroying Ingredients...'
Ingredient.destroy_all if Rails.env.development?

puts 'destroying Cocktails...'
Ingredient.destroy_all if Rails.env.development?

puts 'Creating ingredients...'
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end
