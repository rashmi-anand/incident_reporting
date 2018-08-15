FactoryGirl.define do
  factory :school do
  	name { Faker::Lorem.word }
  	factory :lincoln_high_school do
  		name 'Lincoln High School'
  	end


  end
end
