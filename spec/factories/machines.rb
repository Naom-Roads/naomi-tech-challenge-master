# == Schema Information
#
# Table name: machines
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :machine do
    name { "MyString" }
  end
end
