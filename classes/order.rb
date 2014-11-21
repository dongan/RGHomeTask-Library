
class Order
	attr_accessor :book, :reader, :date

	def intialize(book, reader, date)
		self.book = book
		self.reader = reader
		self.date = date
	end
end