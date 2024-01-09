class UserStocksController < ApplicationController
  def create
    if !current_user.can_track_stock?(params[:ticker])
      flash.now[:notice] = "Cannot track stock #{stock.ticker}"
      redirect_to my_portfolio_path
    end
    stock = Stock.where(ticker: params[:ticker]).first
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      if stock.present?
        stock.save
      else
        render html: "Ticker not found"
      end
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash.now[:notice] = "Stock #{stock.ticker} added to portfolio"
    redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user: current_user, stock: stock).first
    user_stock.destroy
    flash.now[:notice] = "Stock #{stock.ticker} removed"
    redirect_to my_portfolio_path
  end
end
