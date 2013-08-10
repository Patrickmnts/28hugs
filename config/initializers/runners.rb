class NightlyChargeRunner
  def self.run
    @subscribers = Subscriber.daily_charge_list

    @subscribers.each do |subscriber|
      subscriber.charges << Charge.charge(subscriber)
      subscriber.update_attribute(:payment_status, subscriber.charges.last.paid_status)
    end
  end
end