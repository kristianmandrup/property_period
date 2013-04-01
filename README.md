# Property Period

Period for Property.

## Period

Uses gem `timespan`.

* dates - `Timespan`
* flex - `LongDurationRange`

See timespan gem for details. Also see specs ;)

## Usage

```ruby
class Property
  include_concerns :rent_period
end
```

Some API examples

```ruby
property.dates.duration.total

property.dates = ::Timespan.new duration: 2.weeks

property.subject.flex.min == 3.months

property.start_date == Date.today

property.asap?
```

## TODO

Currently, `Period` is hardcoded to expect being embedded in `Property`. This should be refactored to use a polymorphic relationship in the future!

## Copyright

See LICENCE file.