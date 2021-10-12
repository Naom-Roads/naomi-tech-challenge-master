require 'rails_helper'

RSpec.describe MetricsController, type: :controller do
  login_user
  before(:all) do
    20.times do
      FactoryBot.create(:metric)
    end
  end

  describe 'browsing data' do
    context 'with and without params' do
      it 'should show the index' do
        get :index
        expect(response.status).to eq 200
        has_selector? 'h6', text: 'OS VERSION'
      end
    end

    describe 'posting data to the API' do
      context 'when values are invalid' do
        it 'should return an error code if machine_id is invalid' do
          post :create, params: {
            metric: {
              machine_id: 'foo',
              category: 'os_version',
              value: 20
            }
          }
          puts response.parsed_body
          expect(response.status).to eq 400
        end
      end

      describe 'creates or updates a metric' do
        context 'when machine_id and category exist' do
          before do
            @metric = Metric.first
          end
          it 'updates the existing value instead of creating a new metric record' do
            post :create, params: {
              metric: {
                machine_id: @metric.machine_id,
                category: @metric.category,
                value: 30
              }
            }
            expect(response.status).to eq 200
          end
        end
      end

      #TODO I am going to work on splitting the create action so that create and update are seperated and more manageable
      # this will allow me to create two separate tests so that I can verify that both create and update work.


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

# Two tests that sends in fake category, uses metric.category
