FactoryGirl.define do
  factory :incident do  	
  	description { Faker::Lorem.sentence }
  	is_quick true
  	is_anonymous true
  	school
  end
end

