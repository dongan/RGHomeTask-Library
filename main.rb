require_relative 'classes/library.rb'

begin

obj = Library.new("./content/test.yaml")

puts obj.best_seller
puts obj.the_most_active_reader
puts obj.best_sellers_orders_count(3)

rescue WrongArgumentError 

	

end

