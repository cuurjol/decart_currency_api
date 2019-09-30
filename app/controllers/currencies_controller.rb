class CurrenciesController < ApplicationController
  def index
    per_page = 5
    @currencies = paginate(Currency.all.select(:id, :name, :rate), per_page: per_page)
    render(json: { currencies: @currencies, pagination: pagination(per_page) })
  end

  def show
    @currency = Currency.find(params[:id])
    render(json: @currency)
  end

  private

  def pagination(per_page)
    current_page = params[:page].nil? ? 1 : params[:page].to_i
    last_page = (Currency.count / per_page.to_f).ceil
    next_page = current_page == last_page ? nil : current_page + 1
    prev_page = current_page == 1 ? nil : current_page - 1

    {
      "current_page": current_page,
      "last_page": last_page,
      "prev_page_url": prev_page.nil? ? nil : "#{currencies_url}?page=#{prev_page}",
      "next_page_url": next_page.nil? ? nil : "#{currencies_url}?page=#{next_page}"
    }
  end
end
