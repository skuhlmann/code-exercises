class Raindrops
	def self.convert(number)
		message = ""
		message_rules = { 3 => "Pling", 5 => "Plang", 7 => "Plong"}
		message_rules.each do |key, value| 
			message << value if number % key == 0
		end
		message << number.to_s if message == ""
		message
	end
end