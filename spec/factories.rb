FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@examples.com"}  
    sequence(:city)  { |n| "city_#{n}"}   
    style "Normal"  
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
  factory :spot do
    sequence(:name)  			 { |n| "Spot #{n}" }
    sequence(:address1)		 { |n| "Street #{n}"}  
    sequence(:address2) 	 { |n| "Area #{n}"}   
    sequence(:city)				 { |n| "City #{n}"}  
    sequence(:postcode)		 { |n| "#{n}"}  
    sequence(:description) { |n| "Random description #{n}"} 
    spotType "Outside Park"
    user
  end
  factory :review do
    content "Lorem ipsum"
    user
  end
end