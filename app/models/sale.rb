# frozen_string_literal
class Sale < ApplicationRecord
	# br_dinheiro
	usar_como_dinheiro :unit_price
	# Pagination
	paginates_per 20
	# Validations
  validates :buyer, :description, :unit_price, :quantity,
            :supplier, :address, presence: true

  validates_numericality_of :unit_price, :quantity
end
