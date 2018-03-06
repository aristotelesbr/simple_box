require 'rails_helper'

RSpec.describe Services::Persist, type: :model do
  describe '#save' do
    context 'when valid data' do
      let(:array) { build(:persist) }

      it 'with success save' do
        expect(Services::Persist.new(array.normalized).perform).to be(true)
      end
    end
    context 'when invalid data' do
      let(:array) { build(:persist, normalized: ['foo, barr, zaz']) }

      it 'with fail save' do
        expect(Services::Persist.new(array.normalized).perform).not_to be(true)
      end

      it 'returns error message' do
        expect(Services::Persist.new(array.normalized).perform).to include('Erro na importação dos dados!')
      end
    end
  end
end
