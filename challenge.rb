class Challenge
  def self.decode_string(encoded_str)
    data_validation(encoded_str)
  end

  def self.data_validation(encoded_data)
    if(encoded_data.class!=String)
        'Encoded data should be a string'
    end
  end

end
