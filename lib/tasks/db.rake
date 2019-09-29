namespace :db do
  desc 'Update currency rates'
  task update_currency_rates: :environment do
    abort('No currency records. Task cannot be executed.') if Currency.exists?

    json_string = HTTParty.get('http://www.cbr.ru/scripts/XML_daily.asp').parsed_response
    abort('Invalid url or JSON object for currency parsing. Task cannot be executed.') if json_string['ValCurs'].nil?

    updated_flag = false
    json_string['ValCurs']['Valute'].each do |item|
      currency = Currency.find_by_name(item['Name'])
      new_rate = item['Value'].gsub(/,/, '.')
      updated_flag = currency.update_attributes(rate: new_rate) if currency.rate == new_rate
    end

    puts('Currency rates was updated!') if updated_flag
  end
end