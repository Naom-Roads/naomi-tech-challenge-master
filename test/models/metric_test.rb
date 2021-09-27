# == Schema Information
#
# Table name: metrics
#
#  id         :bigint           not null, primary key
#  category   :string
#  name       :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  machine_id :uuid
#
# Indexes
#
#  index_metrics_on_category  (category)
#
require 'test_helper'

class MetricTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
