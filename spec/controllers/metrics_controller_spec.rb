require 'rails_helper'

RSpec.describe MetricsController, type: :controller do
  login_user

  # before(:all) do
  #   20.times do
  #     FactoryBot.create(:metric)
  #   end
  # end

  describe 'browsing data' do
    context 'with and without params' do
      it 'should show the index' do
        get :index # you can pass in a per page amount, add metric creation here and keep it minimal
        expect(response.status).to eq 200
        has_selector? 'h6', text: 'OS VERSION'
      end
    end
  end

  describe 'posting data to the API' do
    context 'when values are invalid' do
      before do
        @metric = {
          machine_id: "foo",
          category: "OS",
          value: nil,
          workstation_id: 1,
        }
      end
      it 'should return an error code if machine_id is invalid' do
        post :create, params: { metric: @metric }
        expect(response.status).to eq 400
      end
    end
  end

  describe 'creates a new metric' do
    context 'when a metric with machine_id or category do not exist' do
      before do
        @metric = {
          machine_id: "foo",
          category: "OS",
          value: 20,
          workstation_id: 1,
        }
      end
      it 'creates an new metric' do
        # expect { post :create, params: { metric: @metric } }.to change(Metric, :count ).by(1)
        post :create, params: { metric: @metric }
        puts response.body
        expect(response.status).to eq 201
      end
    end

    describe 'updates an existing metric if category and machine_id already exist' do
      context 'when machine_id and category exist' do
        before do
          @metric = {
            machine_id: Faker::Internet.uuid,
            category: "os_version",
            value: 20
          }
        end
        it 'updates the existing value instead of creating a new metric record' do
          expect { put :create, params: { metric: @metric.merge(value:30)} }.to change(Metric, :count).by(0)
          expect(response.status).to eq 201
        end
      end
    end

    it 'should return an error code if category is missing' do
      post :create, params: {
        metric: {
          machine_id: Faker::Internet.uuid,
          category: nil,
          value: 20
        }
      }
      expect(response.status).to eq 400
    end

    it 'should return an error code if value is missing' do
      post :create, params: {
        metric: {
          machine_id: Faker::Internet.uuid,
          category: 'ram_usage',
          value: nil
        }
      }
      expect(response.status).to eq 400
    end
  end
end

# Created the separate tests but decided to keep the one action.