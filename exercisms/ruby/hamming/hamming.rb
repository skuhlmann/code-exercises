class Hamming
	def self.compute(strand1, strand2)
		count_smallest_strand_length(strand1, strand2)
		select_mutations(strand1, strand2)
	end

	def self.count_smallest_strand_length(strand1, strand2)
		[strand1.length, strand2.length].min
	end

	def self.select_mutations(strand1, strand2)
		if strand1.length == count_smallest_strand_length(strand1, strand2)
			combined_strands = strand1.split("").zip(strand2.split(""))
			combined_strands.select { |element| element[0] != element[1] }.count 
		else	
			combined_strands = strand2.split("").zip(strand1.split(""))
			combined_strands.select { |element| element[0] != element[1] }.count 
		end
	end
end

