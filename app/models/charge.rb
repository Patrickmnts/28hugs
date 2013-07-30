class Charge < ActiveRecord::Base
	belongs_to :subscriber

  def self.charge(subscriber)
    # charge customer from customer id and then pass the return "hash" into current charge variable
    begin
      charge = Stripe::Charge.create(
        :amount   => 598,
        :currency => "usd",
        :customer => subscriber.stripe_customer_id
      )
    rescue Stripe::InvalidRequestError => e
      logger.error "Stripe error while creating customer: #{e.message}"
      errors.add :base, "There was a problem with your credit card."
    end

    return Charge.create!({
      paid_status: charge.paid,
      last_4: charge.card.last4,
      stripe_token: charge.id,
      subscriber_id: subscriber.id}
    )

  end
end
