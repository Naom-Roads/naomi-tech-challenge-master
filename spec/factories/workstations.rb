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
FactoryBot.define do
  factory :workstation do
    name { "MyString" }
    metrics { nil }
  end
end
