FactoryBot.define do
  factory(:persist, class: Services::Persist) do
	  content = File.read(File.open(File.join(Rails.root, 'spec', 'fixtures', 'files', 'dados.txt')))
  	transient do
  		text Services::Normalizer.new(content).normalize!
    end
    initialize_with { Services::Persist.new(text) }
  end
end
