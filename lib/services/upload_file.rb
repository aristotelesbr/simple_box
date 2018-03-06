module Services
  # Class to seach
  class UploadFile
    include ActiveModel::Validations
    include ActiveModel::Model

    attr_accessor :content_type,
                  :filename, :tempfile

    def initialize(options = {})
      @content_type = options[:file].content_type unless options.empty?
      @filename = options[:file].original_filename unless options.empty?
      @tempfile = options[:file].tempfile unless options.empty?
    end

    def save
      return false unless valid_object && persist_normalized
    end

    def valid_object
      valid_type? && valid_extension? && valid_header?
    end

    def persist_normalized
      @normalized = Normalizer.new(content_file).normalize!
      Persist.new(@normalized).perform
    end

    private

    def valid_type?
      @content_type == 'text/plain'
    end

    def valid_extension?
      @filename.split('.').last == 'txt'
    end

    def valid_header?
      header = content_file.split("\n").first.split("\t")
      header.eql?(columns_attributes)
    end

    def content_file
      File.read(@tempfile)
    end

    def columns_attributes
      [
        "Comprador",
        "Descrição",
        "Preço Unitário",
        "Quantidade",
        "Endereço",
        "Fornecedor"
      ]
    end
  end
end
