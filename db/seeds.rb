json_string = HTTParty.get('http://www.cbr.ru/scripts/XML_daily.asp').parsed_response
abort('Invalid url or JSON object for currency parsing. Task cannot be executed.') if json_string['ValCurs'].nil?

json_string['ValCurs']['Valute'].each do |item|
  Currency.create(name: item['Name'], rate: item['Value'].gsub(/,/, '.'))
end
