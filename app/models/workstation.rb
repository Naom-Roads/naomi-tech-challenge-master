# == Schema Information
#
# Table name: workstations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Workstation < ApplicationRecord
  belongs_to :user
  has_many :metrics
  validates :name, presence: true
end
