class Property
  class Period
    # include BasicDocument
    include Mongoid::Document
    include Mongoid::Timespanned

    field :dates,    :type => ::Timespan, :between => true
    field :flex,     :type => ::LongDurationRange

    embedded_in :property, class_name: 'Property', inverse_of: :period

    # From Account example in timespan gem
    #=====================================
    # timespan_methods :period

    # embeds_one :time_period
    
    # timespan_container_delegates :time_period, :dates, :all

    # def self.create_it! duration, flex = nil
    #   acc = self.new period: ::Timespan.new(duration: duration), time_period: ::TimePeriod.new
    #   acc.time_period.dates_duration = 1.day
    #   acc.time_period.flex = flex if flex
    #   acc
    # end

    timespan_methods :dates

    # override defaults
    max_asap 14.days.from_now
    min_asap 2.days.ago

    asap_method :period
    duration_methods :flex

    # field :time,      type: Timespan # Flexible: fx 3 months to 6 months
    field        :asap,  type: Boolean # Start ASAP
    alias_method :asap?, :asap

    # defaults
    after_initialize do
      self.dates = ::Timespan.new duration: 2.months unless self.dates
    end

    def to_s
      s = []
      s << "dates: " << dates ? dates : "no date period"
      s << "flex: " << flex ? flex : "no flex period"
      s.join ' '
    end    

    def short_desc
      [desc_start_date, desc_end_date].join(' ')
    end

    def self.create_it! options = {}
      self.new dates: ::Timespan.new(options)
    end

    def self.create_default! 
      self.create_it! start_date: Date.today, duration: 1.month
    end

    def desc_start_date
      asap? ? "ASAP for" : DateTime.parse(start_date.to_s).strftime('%d %b %Y') + " to "
    end

    def desc_end_date
      asap? ? flex : DateTime.parse(end_date.to_s).strftime('%d %b %Y')
    end
  end
end