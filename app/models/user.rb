class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :friendships
  has_many :friends, through: :friendships

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

  def self.search(param)
    param.strip!
    to_send_back = matches("first_name", param) + matches("last_name", param) + matches("email", param)
    return nil unless to_send_back
    to_send_back.uniq
  end

  def self.matches(field_name, param)
    User.where("#{field_name} like ?", "%#{param}%")
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id}
  end

  def is_friend_with?(friend_id)
    self.friends.where(id: friend_id).exists?
  end
end
