# == Schema Information
#
# Table name: workstations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :workstation do
    name { "MyString" }
  end
end
