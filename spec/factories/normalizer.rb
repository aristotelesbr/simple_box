FactoryBot.define do
  factory(:normalizer, class: Services::Normalizer) do
  	transient do
  		text File.read(File.open(File.join(Rails.root, 'spec', 'fixtures', 'files', 'dados.txt')))
    end

    initialize_with { Services::Normalizer.new(text).normalize! }
  end
end
