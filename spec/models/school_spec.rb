require 'rails_helper'

RSpec.describe School, type: :model do
  it "has a valid factory" do
  	FactoryGirl.create(:school).should be_valid
  end

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }


end
