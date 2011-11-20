class Camp < ActiveRecord::Base
  
  def to_s
    "Occupy #{city}"
  end
  
  def import_csv
    require 'csv'

    csv_text = File.read('occupy.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      Camp.create!(row.to_hash.symbolize_keys)
    end
  end
  
  def news
    require 'httparty'
    require 'htmlentities'
    
    json = HTTParty.get "https://ajax.googleapis.com/ajax/services/search/news?v=1.0&q=occupy%20#{city.parameterize}"
    items = json.parsed_response['responseData']['results'].map do |news| 
      { :title => HTMLEntities.new.decode(Sanitize.clean(news['title'])), :url => news['unescapedUrl'] }
    end
  end
  
  def twitter_page
    if twitter.present?
      twitter
    else
      "occupy#{city}"
    end
  end
  
  # def twitter_page
  #   if twitter.present?
  #     "http://www.twitter.com/#{twitter}"
  #   else
  #     require 'httparty'
  #     require 'htmlentities'
  #   
  #     json = HTTParty.get "http://www.google.co.uk/search?q=occupy+#{city}+twitter", {:no_follow => true}
  #     # get the url somehow?
  #   end
  # end
end
