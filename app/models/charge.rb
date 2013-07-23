class Charge < ActiveRecord::Base
	belongs_to :subscriber

	def self.charge_machine

    @subscribers = Subscriber.where(ship_date: Date.today)

    @subscribers.each do |s|

        # charge customer from customer id and then pass the return "hash" into current charge variable
      current_charge = Stripe::Charge.create(
      :amount   => 598,
      :currency => "usd",
      :customer => s.stripe_customer_id
      )

       # get values from returned hash and assign them to corresponding locations in database
      s.payment_status = current_charge.paid
      last_4 = current_charge.card.last4
      charge_token = current_charge.id
      s.save
        #add values to charge-params from @subscriber & stripe return
      @charge = Charge.new(paid_status: current_charge.paid, last_4: last_4, stripe_token: charge_token, subscriber_id: s.id)
        if @charge.save
         	#s.payment_status = "good"
          puts "success and other stuff"
        else
          puts "HUUUUUGGGGEEEEE PPRRRRROOOOBBBBLLLLEEMMM"
        end
    end
	end
end
