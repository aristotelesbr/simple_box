module Services
	class Normalizer
		attr_accessor :text

		def initialize(text)
			@text = text
		end

		def normalize!
			remove_header!
		end

		private

		def remove_header!
			@text.split("\n").drop(1)
		end
	end
end
