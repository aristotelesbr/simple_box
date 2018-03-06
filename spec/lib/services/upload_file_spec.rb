require 'rails_helper'

RSpec.describe Services::UploadFile, type: :model do
  describe '#valid_type?' do
    context 'when valid data' do
      let(:file) { build(:upload_file) }

      it 'with valid content_type' do
        expect(file.content_type).to eq('text/plain')
      end
    end
    context 'when invalid data' do
      let(:file) { build(:upload_file, content_type: 'img/jpg') }

      it 'with invalid content_type' do
        expect(file.content_type).to eq('img/jpg')
      end
    end
  end

  describe '#valid_extension?' do
    context 'when valid data' do
      let(:file) { build(:upload_file) }

      it 'with valid extension' do
        expect(file.filename.split('.').last).to eq('txt')
      end
    end
    context 'when invalid data' do
      let(:file) { build(:upload_file, filename: 'avatar.jpg' ) }

      it 'with invalid extension' do
        expect(file.filename.split('.').last).to eq('jpg')
      end
    end
  end

  describe '#valid_header?' do
    context 'when valid file' do
      let(:file) { build(:upload_file) }
        
      it 'with valid header attributes' do
        header = File.read(file.tempfile).split("\n").first.split("\t")
        expect(header).to eq(columns_attributes)
      end
    end

    context 'when invalid file' do
      let(:file) { build(:upload_file) }
        
      it 'with invalid header attributes' do
        header = File.read(file.tempfile).split("\n").first.split("\t").pop
        expect(header).not_to eq(columns_attributes)
      end
    end
  end
end
