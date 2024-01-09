class StocksController < ApplicationController
  def search
    ticker = params[:stock]
    if ticker.present? && ticker.length > 0
      @stock = Stock.new_lookup(ticker)
      if @stock

      else
        flash.now[:alert] = "Stock " + ticker + " not found"
      end
    else
      flash.now[:notice] = "Please enter a symbol"
    end

    respond_to do |format|
      format.js { render partial: "users/result"}
    end
  end
end
