FactoryBot.define do
  factory(:upload_file, class: Services::UploadFile) do
    content_type 'text/plain'
    filename 'data.txt'
    tempfile File.open(File.join(Rails.root, 'spec', 'fixtures', 'files', 'dados.txt'))
  end
end
