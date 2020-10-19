require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #show' do
    before do
      create :event, start_date: 1.month.ago, end_date: 1.month.ago + 1.hour
      create :event, start_date: Time.zone.now, end_date: Time.zone.now
      create :event, start_date: 1.month.since, end_date: 1.month.since + 1.hour
    end

    let(:month) { Time.zone.now.month }

    context 'when the events are requested' do
      before { get :show, params: {id: month} }

      it 'returns only one event' do
        expect(data.size).to eq 1
      end

      it 'is during this month' do
        event = data.first
        beginning_of_month = Time.zone.now.beginning_of_month
        end_of_month = Time.zone.now.end_of_month

        expect(event.start_date).to be_between(beginning_of_month, end_of_month)
        expect(event.start_date).to be_between(beginning_of_month, end_of_month)
      end
    end
  end
end
