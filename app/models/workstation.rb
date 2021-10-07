# == Schema Information
#
# Table name: workstations
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_workstations_on_user_id  (user_id)
#
class Workstation < ApplicationRecord
  belongs_to :user
  has_many :metrics
  validates :name, presence: true
end
