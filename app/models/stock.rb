class Stock < ApplicationRecord

  def self.new_stock(ticker)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    client.price(ticker)
  end
end
