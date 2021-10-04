# == Schema Information
#
# Table name: workstations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  metrics_id :bigint
#
# Indexes
#
#  index_workstations_on_metrics_id  (metrics_id)
#
# Foreign Keys
#
#  fk_rails_...  (metrics_id => metrics.id)
#
require 'rails_helper'

RSpec.describe Workstation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
