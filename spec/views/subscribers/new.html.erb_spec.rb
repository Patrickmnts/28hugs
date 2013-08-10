require 'spec_helper'

describe "subscribers/new" do
  before(:each) do
    assign(:subscriber, stub_model(Subscriber,
      :email => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :phone => "MyString",
      :billing_address => "MyString",
      :billing_city => "MyString",
      :billing_state => "MyString",
      :billing_zip => "MyString",
      :stripe_customer_id => "MyString",
      :payment_status => "MyString",
      :recipient_name => "MyString",
      :recipient_address => "MyString",
      :recipient_city => "MyString",
      :recipient_state => "MyString",
      :recipient_zip => "MyString"
    ).as_new_record)
  end

  it "renders new subscriber form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subscribers_path, "post" do
      assert_select "input#subscriber_email[name=?]", "subscriber[email]"
      assert_select "input#subscriber_first_name[name=?]", "subscriber[first_name]"
      assert_select "input#subscriber_last_name[name=?]", "subscriber[last_name]"
      assert_select "input#subscriber_phone[name=?]", "subscriber[phone]"
      assert_select "input#subscriber_billing_address[name=?]", "subscriber[billing_address]"
      assert_select "input#subscriber_billing_city[name=?]", "subscriber[billing_city]"
      assert_select "input#subscriber_billing_state[name=?]", "subscriber[billing_state]"
      assert_select "input#subscriber_billing_zip[name=?]", "subscriber[billing_zip]"
      assert_select "input#subscriber_stripe_customer_id[name=?]", "subscriber[stripe_customer_id]"
      assert_select "input#subscriber_payment_status[name=?]", "subscriber[payment_status]"
      assert_select "input#subscriber_recipient_name[name=?]", "subscriber[recipient_name]"
      assert_select "input#subscriber_recipient_address[name=?]", "subscriber[recipient_address]"
      assert_select "input#subscriber_recipient_city[name=?]", "subscriber[recipient_city]"
      assert_select "input#subscriber_recipient_state[name=?]", "subscriber[recipient_state]"
      assert_select "input#subscriber_recipient_zip[name=?]", "subscriber[recipient_zip]"
    end
  end
end
