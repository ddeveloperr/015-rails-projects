module Stripe
  class Transfer < APIResource
    extend Stripe::APIOperations::List
    extend Stripe::APIOperations::Create
    include Stripe::APIOperations::Update

    def cancel
      response, api_key = Stripe.request(:post, cancel_url, @api_key)
      initialize_from(response, api_key)
    end

    def cancel_url
      resource_url + '/cancel'
    end

  end
end
