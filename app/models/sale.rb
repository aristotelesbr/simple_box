# frozen_string_literal
class Sale < ApplicationRecord
	# Pagination
	paginates_per 20
	# Validations
  validates :buyer, :description, :unit_price, :quantity,
            :supplier, :address, presence: true

  validates_numericality_of :unit_price, :quantity
end
