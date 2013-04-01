FactoryGirl.define do
  factory :rent_period_property, class: 'Property' do

    trait :valid do
      after :build do |property|
        FactoryGirl.create :valid_period, property: property
      end
    end 

    factory :valid_rent_period_property, traits: [:valid] 
  end
end
