require_relative 'author.rb'
require_relative 'book.rb'
require_relative 'order.rb'
require_relative 'reader.rb'
require_relative 'exceptions.rb'
require_relative 'file_connector.rb'
require 'yaml'

class Library
	attr_accessor :books, :orders, :readers, :authors
	attr_reader :best_seller, :the_most_active_reader
	include File_connector

	def initialize(file)
		load_from(file)
		create_book_hash
		create_reader_hash
		determine_best_seller
		determine_most_active_reader
    end

	def best_sellers_orders_count(num)
		
		if num > @books_hash.length
			error = WrongArgumentError.new
			error.error_text = "Попадалаво да? Нехрен числа больше длины хеша передавать"
			raise error
		end

		number_of_orders = 0

		orders.each do |order|
			num.times do |i|
				number_of_orders+=1 if @books_hash.sort_by{|k,v| v}.reverse[i][0]==order.book
			end
		end

		number_of_orders
	end

	private

	def determine_best_seller
		@best_seller = @books_hash.sort_by{|k,v| v}.reverse[0][0]
	end

	def determine_most_active_reader
		@the_most_active_reader = @readers_hash.sort_by{|k,v| v}.reverse[0][0]
	end

	def create_book_hash
		@books_hash = Hash.new
		
		books.each do |book|
			book_orders = 0

			orders.each do |order|
				book_orders+=1 if order.book == book.title
			end

			@books_hash["#{book.title}"] = book_orders
		end
	end

	def create_reader_hash
		@readers_hash = Hash.new

		readers.each do |reader|
			reader_orders = 0

			orders.each do |order|
				reader_orders+=1 if order.reader == reader.name
			end

			@readers_hash["#{reader.name}"] = reader_orders
		end
	end

end

	















