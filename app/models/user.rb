class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def stock_already_tracked?(ticker)
    stock = Stock.where(ticker: ticker).first
    return false unless stock
      stocks.where(id: stock.id).exists?
  end

  def can_track_stock?(ticker)
    stocks.count < 10 && !stock_already_tracked?(ticker)
  end

  def full_name
    return "#{first_name} #{last_name}" if first_name || last_name
    "Anonymous"
  end
end
