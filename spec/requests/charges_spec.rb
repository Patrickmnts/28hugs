require 'spec_helper'


describe "Charges" do
	before do
		@charge = Charge.new(paid_status: "y", last_4: "1234", stripe_token: "test_token", subscriber_id: rand(100))
	end
  describe "GET /charges" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get charges_path
      response.status.should be(200)
    end
  end
  describe "saves to the datebase" do
  	it "increases the number of charges in database" do
        expect{@charge.save}.to change(Charge, :count).by(1)
  	end
	end

end
