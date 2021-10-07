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
require 'rails_helper'

RSpec.describe Workstation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
