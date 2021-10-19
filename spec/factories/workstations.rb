# == Schema Information
#
# Table name: workstations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  machine_id :uuid
#  user_id    :bigint
#
# Indexes
#
#  index_workstations_on_user_id  (user_id)
#
FactoryBot.define do
  factory :workstation do
    user { build(:user)}
    name { Faker::Internet.name }
  end
end
