FactoryGirl.define do
  sequence(:flex)  { (0..3).minutes }
  sequence(:dates) { Timespan.from(:today, 5.days) }

  factory :period, class: 'Property::Period' do  
    trait :valid do
      flex
      dates

      after :create do |period, evaluator|
        period.asap_for :dates if evaluator.asap
      end
    end 

    factory :valid_period, traits: [:valid] 
  end
end