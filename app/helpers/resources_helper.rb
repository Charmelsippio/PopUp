module ResourcesHelper
  def get_parameters(url)
    websites={wapo:"http://www.washingtonpost.com", nytimes:"http://www.nytimes.com/", atlantic:"http://www.theatlantic.com/", aljazeera:"http://www.aljazeera.com/", npr:"http://www.npr.org/"}

    websites.key.each_with_index do |key, index|
      value = websites[key]

      if url.match(/.*.\.com/)[0] == value
        return send("#{key}", "#{url}")
      end #if end
    end #do end
  end #def end
end #module end
