module Services
	class Persist
		include ActiveModel::Validations
    include ActiveModel::Model

		attr_accessor :normalized

		def initialize(normalized)
			@normalized = normalized
		end

		def perform
			begin
				@normalized.each do |arr|
					Sale.create!(
						buyer: arr[0],
						description: arr[1],
						unit_price: arr[2],
						quantity: arr[3].to_i,
						supplier: arr[5],
						address: arr[4]
					)
				end
				true
			rescue Exception => e
				errors.add('*', 'Erro na importação dos dados!')
				# SendEamail.new(e).dispath
			end
		end
	end
end
