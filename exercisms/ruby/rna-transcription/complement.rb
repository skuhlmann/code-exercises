class Complement

	def self.of_dna(strand)
		strand.gsub(/[GCTA]/, 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U')
	end

	def self.of_rna(strand)
		strand.gsub(/[CGAU]/, 'C' => 'G', 'G' => 'C', 'A' => 'T', 'U' => 'A')
	end	
end

#explore the 'tr' method on strings --http://www.ruby-doc.org/core-2.1.2/String.html#method-i-tr