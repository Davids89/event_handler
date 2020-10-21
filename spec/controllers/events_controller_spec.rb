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

  describe 'POST #create' do
    context 'when the event has correct params' do
      let(:params) do
        {
          title: 'Event',
          description: 'Description',
          start_date: Time.zone.tomorrow.beginning_of_day,
          end_date: Time.zone.tomorrow.end_of_day
        }
      end

      before { post :create, params: {data: params} }

      it 'returns 200 https status code' do
        expect(response).to have_http_status 200
      end

      it 'returns the correct event values' do
        expect(data.title).to eq params[:title]
        expect(data.description).to eq params[:description]
        expect(data.start_date).to eq params[:start_date].strftime('%d/%m/%Y')
        expect(data.end_date).to eq params[:end_date].strftime('%d/%m/%Y')
      end
    end

    context 'when the event has incorrect params' do
      let(:params) do
        {
          title: 'Event',
          description: 'Description',
          start_date: Time.zone.tomorrow.beginning_of_day,
          end_date: Time.zone.today.beginning_of_day
        }
      end

      before { post :create, params: {data: params} }

      it 'returns 422 http status code' do
        expect(response).to have_http_status 422
      end

      it 'returns correct error message' do
        expect(errors[:end_date]).to include(
          {error: 'after', restriction: params[:start_date].strftime('%Y-%m-%d %H:%M:%S')}
        )
      end
    end

    context 'when no params are sent' do
      let(:params) do
        {
          title: ''
        }
      end

      before { post :create, params: {data: params} }

      it 'returns 422 http status code' do
        expect(response).to have_http_status 422
      end
    end
  end

  describe 'PUT #update' do
    let(:event_to_update) { create :event }

    context 'when the user send correct params' do
      let(:params) do
        {
          title: 'New title',
          description: event_to_update.description,
          start_date: event_to_update.start_date,
          end_date: event_to_update.end_date
        }
      end

      before { put :update, params: {id: event_to_update.id, data: params} }

      it 'returns 200 http status code' do
        expect(response).to have_http_status 200
      end

      it 'change the title correctly' do
        expect(data.title).to eq params[:title]
      end

      it 'does not change the rest of params' do
        expect(data.description).to eq event_to_update.description
        expect(data.start_date).to eq event_to_update.start_date.strftime('%d/%m/%Y')
        expect(data.end_date).to eq event_to_update.end_date.strftime('%d/%m/%Y')
      end
    end

    context 'when the user send incorrect params' do
      let(:params) do
        {
          start_date: Time.zone.now,
          end_date: Time.zone.now - 1.hour
        }
      end

      before { put :update, params: {id: event_to_update.id, data: params} }

      it 'returns 422 http status code' do
        expect(response).to have_http_status 422
      end
    end

    context 'when the user send no params' do
      let(:params) do
        {
          title: ''
        }
      end

      before { put :update, params: {id: event_to_update.id, data: params} }

      it 'returns 422 http status code' do
        expect(response).to have_http_status 422
      end
    end
  end
end
