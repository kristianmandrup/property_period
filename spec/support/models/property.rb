class Property
  include Mongoid::Document

  include_concerns :rent_period
end