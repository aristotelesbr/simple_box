# frozen_string_literal
class Sale < ApplicationRecord
  validates :buyer, :description, :unit_price, :quantity,
            :supplier, :address, presence: true

  validates_numericality_of :unit_price, :quantity
end
