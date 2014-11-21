
module File_connector
	def save_to(file)
		File.open(file, "w") {|file| file.puts(self.to_yaml) }
	end

	def load_from(file)
		File.open(file, "r") do |file|
			@new_lib = YAML.load(file)
		end

		self.books = @new_lib.books 
		self.orders = @new_lib.orders
		self.readers = @new_lib.readers
		self.authors = @new_lib.authors
	end
end