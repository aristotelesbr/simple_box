require 'rails_helper'

RSpec.describe Sale, type: :model do
	it { is_expected.to validate_presence_of(:buyer) }
	it { is_expected.to validate_presence_of(:description) }
	it { is_expected.to validate_presence_of(:unit_price) }
	it { is_expected.to validate_presence_of(:quantity) }
	it { is_expected.to validate_presence_of(:supplier) }
	it { is_expected.to validate_presence_of(:address) }
	
	it { is_expected.to validate_numericality_of(:quantity) }
	it { is_expected.to validate_numericality_of(:unit_price) }
end
