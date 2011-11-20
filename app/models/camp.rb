class Camp < ActiveRecord::Base
  
  def import_csv
    require 'csv'

    csv_text = File.read('occupy.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      Camp.create!(row.to_hash.symbolize_keys)
    end
  end
end
