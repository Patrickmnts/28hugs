require 'spec_helper'

describe Charge do
  let(:valid_charge_attributes) {{"paid_status" => "y", "stripe_token" => "test_token", "last_4" => 1234, "subscriber_id" => "test_id" }}
  let(:valid_subscriber_attributes) { { "email" => "email@example.com", "password" => "passy123", "password_confirmation" => "passy123", "first_name" => "testname", "last_name" => "testlastname"} }


  it "should have more than one customer with a valid charge(todays) date" do
  	pending
  end

  it "should have one customer with an invalid(not todays) date" do
  	pending
  end

  it "should not select people that don't have todays date for ship date" do
  	pending
  end

  it "should return a succesful charge for each customer" do
  	pending
  end

  it "should add payment status to charge" do
  	pending
  end

  it "should add last 4 of credit card to charge" do
  	pending
  end

  it "should add subscriber_id to charge" do
  	pending
  end

  it "should add subscriber_id to charge" do
  	pending
  end
end





#  subscriber params

