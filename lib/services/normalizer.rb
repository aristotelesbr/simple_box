module Services
  class Normalizer
    attr_accessor :text

    def initialize(text)
      @text = text
    end

    def normalize!
      remove_header
    end

    private

    def remove_header
      @text = @text.split("\n").drop(1)
      sanatize(@text)
    end

    def sanatize(arr)
      arr.map {|i| i.split("\t")}
    end
  end
end
