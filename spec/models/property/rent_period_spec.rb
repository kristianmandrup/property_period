require 'spec_helper'

describe Property::Period do
  subject { property }

  let(:property)  { create :property }
  let(:period)    { property.period }

  it 'should be set' do
    expect(subject.period).to_not be_nil
  end

  describe 'period' do
    subject { period }

    it 'should be a Property::Period' do
      expect(subject).to be_a Property::Period
    end

    context 'default field values' do
      describe 'dates' do
        it 'should be a Timespan' do
          expect(subject.dates).to be_a ::Timespan
        end

        it 'should be a Timespan' do
          expect(subject.dates.duration.total).to eq 2.months
        end
      end

      describe 'flex' do
        it 'should not be set' do
          expect(subject.flex).to be_nil
        end
      end

      describe 'asap' do
        it 'should not be' do
          expect(subject.asap).to be_false
        end
      end

      describe 'asap?' do
        it 'should not be' do
          expect(subject.asap?).to be_false
        end
      end      
    end

    context 'set dates' do
      before do
        subject.dates = ::Timespan.new duration: 2.weeks
      end

      it 'should be a Timespan' do
        expect(subject.dates).to be_a ::Timespan
      end
    end

    describe 'flex macro' do
      it 'should create a ::LongDurationRange' do
        expect( (3..6).months! ).to be_a ::LongDurationRange
      end
    end

    context 'set flex' do
      before do
        subject.flex = (3..6).months! # ::LongDurationRange.new (3..6), :months
      end

      it 'should be a LongDurationRange' do
        expect(subject.flex).to be_a ::LongDurationRange
      end

      it 'should be min 3 months' do
        expect(subject.flex.min).to eq 3.months
      end

      it 'should be max 6 months' do
        expect(subject.flex.max).to eq 6.months
      end

      it 'time unit should be months' do
        expect(subject.flex.unit).to eq :months
      end
    end

    describe 'delegators' do
      describe 'getters' do
        it 'should get start_date' do
          expect(subject.start_date).to_not be_nil   
        end

        it 'should get end_date' do
          expect(subject.end_date).to_not be_nil   
        end

        it 'should get duration' do
          expect(subject.duration).to_not be_nil   
        end
      end

      describe 'setters' do
        pending 'TODO'
      end
    end
  end
end