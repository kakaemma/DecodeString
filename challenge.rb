class Challenge
    def self.decode_data(encoded_str)
        data = encoded_str.split('')
        counter = data.count(']')
        if counter==1
            return decode_single_br(encoded_str)
        end
        if counter >1
            count =0
            decrypt_container = []
            counter.times do
                if count==0
                    decrypt_txt = decode_single_br(encoded_str)
                    decrypt_container.push(decrypt_txt.to_s)
                elsif count>0
                    new_string = decrypt_container.pop()
                    decrypt_txt = decode_single_br(new_string)
                    decrypt_container.push(decrypt_txt)
                end
                count+=1
            end
            return decrypt_container.pop
        end
    end

    def self.decode_single_br (encoded_data)
        data = encoded_data.split('')
        opening= data.index('[')
        closing= data.index(']')
        multiplier = data[opening-1].to_i
        rpt_string = data[opening+1..closing-1].join
        str_repeated = rpt_string*multiplier
        remaining_string = ''+data[closing+1..data.length].join
        str_data = data[0..opening-2].join
        new_string = str_data+str_repeated+remaining_string
        return new_string
    end

end

ecoded_text = 'a3[b]3[d]4[o]'
puts Challenge.decode_data(ecoded_text)