require_relative 'author.rb'

class Book
	attr_accessor :title, :author

	def initialize(title, author = "anonimous")
		@title = title
		@author = author
	end
end
