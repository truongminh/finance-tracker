class StocksController < ApplicationController
  def search
    ticker = params[:stock]
    if ticker.present? && ticker.length > 0
      @stock = Stock.new_lookup(ticker)
      if !@stock
        flash[:notice] = "Stock " + ticker + " not found"
      end
    end
    render template: "users/my_portfolio"
  end
end
