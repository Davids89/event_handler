require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Fields' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:start_date).of_type(:datetime) }
    it { is_expected.to have_db_column(:end_date).of_type(:datetime) }
  end

  describe 'Validations' do
    describe 'start_date' do
      it { is_expected.to validate_presence_of(:start_date) }
      it { is_expected.to validate_presence_of(:end_date) }

      context 'when start date and end date are nil' do
        let(:event) { build :event, start_date: nil, end_date: nil }

        before do
          event.valid?
        end

        it 'returns error' do
          expect(event.errors.details[:start_date]).to include({error: :blank})
          expect(event.errors.details[:end_date]).to include({error: :blank})
        end
      end

      context 'when end_date is before start_date' do
        let(:event) { build :event, start_date: Time.zone.now, end_date: 1.day.ago }

        before do
          event.valid?
        end

        it 'is not valid' do
          expect(event).not_to be_valid
        end
      end

      context 'when start_date is after end_date' do
        let(:event) { build :event, start_date: 1.day.since, end_date: Time.zone.now }

        before do
          event.valid?
        end

        it 'is not valid' do
          expect(event).not_to be_valid
        end
      end
    end

    describe 'title' do
      it { is_expected.to validate_presence_of(:title) }

      context 'when title is nil' do
        let(:event) { build :event, title: nil }

        before do
          event.valid?
        end

        it 'returns error' do
          expect(event.errors.details[:title]).to include({error: :blank})
        end
      end
    end
  end
end
