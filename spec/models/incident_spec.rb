require 'rails_helper'

RSpec.describe Incident, type: :model do 
	it "has a valid factory" do
  	FactoryGirl.create(:incident).should be_valid
  end

  it { should belong_to :school }
  it { should validate_presence_of :description }

  describe "When the report is detailed" do
	  describe "check for reportee email " do	  	
		  it "should be valid if reportee email is empty" do
		  	@incident = FactoryGirl.build(:incident, is_quick: false, reportee_email: "")
		  	expect(@incident).to be_valid 
		  end

		  it "should not be valid if given reportee email is invalid" do
		  	@incident = FactoryGirl.build(:incident, is_quick: false, reportee_email: "cynthiagmail.com")
		  	expect(@incident).not_to be_valid 	
		  end

		  it "should be valid if given reportee email is correct" do
		  	@incident = FactoryGirl.build(:incident, is_quick: false, reportee_email: "cynthia@gmail.com")
		  	expect(@incident).to be_valid 	
		  end
		end

		it "should have is_anonymous true, if no reportee details given and is_anonymous is nil " do
			@incident = FactoryGirl.create(:incident, is_quick: false, is_anonymous: nil)
			expect(@incident.is_anonymous).to eq(true)
		end
	end
end
