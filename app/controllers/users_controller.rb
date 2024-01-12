class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
    param = params[:friend]
    if param.present?
      @friends = User.search(param)
      @friends = current_user.except_current_user(@friends)
    end
    respond_to do |format|
      format.js { render partial: "friends/result"}
    end
  end

  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end
end
