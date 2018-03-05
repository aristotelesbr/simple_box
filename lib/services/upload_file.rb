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
      return false unless valid_object
    end

    def valid_object
      valid_type?
      valid_extension?
      valid_header?
    end

    private

    def valid_type?
      @content_type == 'text/plain'
    end

    def valid_extension?
      @filename.split('.').last == 'txt'
    end

    def valid_header?
      header = File.read(@tempfile).split("\n").first.split("\t")
      header.eql?(columns_attributes)
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
