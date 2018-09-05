require 'httparty'

toronto_wards_response = HTTParty.get('https://represent.opennorth.ca/boundaries/toronto-wards/')
toronto_wards_json = JSON.parse(toronto_wards_response.body)

toronto_wards_json['objects'].each do |ward|
puts ward['name']

end

puts "=============================="

house_commons_response = HTTParty.get('https://represent.opennorth.ca/representatives/house-of-commons/?limit=1000')

house_commons_json = JSON.parse(house_commons_response.body)


house_commons_json['objects'].sort_by! {|hash| hash['name']}.each do |person|
  puts person['name']
end
