class Property
  module RentPeriod
    extend ActiveSupport::Concern
    include Mongoid::Timespanned

    included do
      embeds_one :period, class_name: 'Property::Period', inverse_of: :property

      # delegate period methods

      timespan_methods :dates, :all
      
      timespan_container_delegates :period, :dates, :all
      timespan_container_delegates :period, :flex, :all

      after_initialize do
        self.period = Property::Period.create property: self unless self.period
      end
    end
  end
end