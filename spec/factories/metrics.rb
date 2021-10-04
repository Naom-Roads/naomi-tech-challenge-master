# == Schema Information
#
# Table name: metrics
#
#  id         :bigint           not null, primary key
#  category   :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  machine_id :uuid
#
# Indexes
#
#  index_metrics_on_category  (category)
#
FactoryBot.define do
  factory :metric do
    category { "os_version" }
    value { "Windows 10 Pro" }
    machine_id { Faker::Internet.uuid }
  end
end
