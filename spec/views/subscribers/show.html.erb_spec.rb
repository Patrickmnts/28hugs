require 'spec_helper'

describe "subscribers/show" do
  before(:each) do
    @subscriber = assign(:subscriber, stub_model(Subscriber,
      :email => "Email",
      :first_name => "First Name",
      :last_name => "Last Name",
      :phone => "Phone",
      :billing_address => "Billing Address",
      :billing_city => "Billing City",
      :billing_state => "Billing State",
      :billing_zip => "Billing Zip",
      :payment_status => "Payment Status",
      :recipient_name => "Recipient Name",
      :recipient_address => "Recipient Address",
      :recipient_city => "Recipient City",
      :recipient_state => "Recipient State",
      :recipient_zip => "Recipient Zip"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Phone/)
    rendered.should match(/Billing Address/)
    rendered.should match(/Billing City/)
    rendered.should match(/Billing State/)
    rendered.should match(/Billing Zip/)
    rendered.should match(/Payment Status/)
    rendered.should match(/Recipient Name/)
    rendered.should match(/Recipient Address/)
    rendered.should match(/Recipient City/)
    rendered.should match(/Recipient State/)
    rendered.should match(/Recipient Zip/)
  end
end
