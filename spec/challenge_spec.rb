
# spec/decode_string_spec.rb
require_relative('../challenge')

RSpec.describe Challenge do
   describe "Validations - " do

      context "Encoded string length < 1 : " do
        it "should return error message if length is zero" do
           encoded_str =''
           decoded_data = Challenge.decode_string(encoded_str)
           expect(decoded_data).to eq 'Decoding Error: Min string length is 1'
        end
      end
      context "Encoded string length >30 : " do
        it "should return error message if length is greater than 30" do
            encoded_str ='2[abc]3[cd]ef"2[abc]3[cd]ef3[cd]ef'
            decoded_data = Challenge.decode_string(encoded_str)
            expect(decoded_data).to eq 'Decoding Error: Max String length is 30'
        end
      end

      context "Econded data is not of type string" do
         it "should return Type Error" do
            encoded_str = 12345678
              decoded_data = Challenge.decode_string(encoded_str)
            expect(decoded_data).to eq 'Encoded data should be a string'
         end
      end
   end

  describe "Decoding - " do
    it "should decode the string" do
       encoded_str = '3[a]2[bc]'
       decoded_data = Challenge.decode_string(encoded_str)
       expect(decoded_data).to eq 'aaabcbc'
    end
  end
end
