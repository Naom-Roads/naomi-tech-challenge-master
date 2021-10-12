# == Schema Information
#
# Table name: metrics
#
#  id             :bigint           not null, primary key
#  category       :string
#  name           :string
#  value          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  machine_id     :uuid
#  workstation_id :bigint
#
# Indexes
#
#  index_metrics_on_category        (category)
#  index_metrics_on_workstation_id  (workstation_id)
#
require 'rails_helper'

RSpec.describe Metric, type: :model do

  context 'creating a new metric' do
    it 'should fail without a valid UUID for machine' do
      expect{ FactoryBot.create(:metric, machine_id: "foo") }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'should fail if no category is given' do
      expect{ FactoryBot.create(:metric, category: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'should fail if no value is given' do
      expect{ FactoryBot.create(:metric, value: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
