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
class Metric < ApplicationRecord
  belongs_to :workstation
  paginates_per 10

  before_validation :format_category
  validates_presence_of :category
  validates_presence_of :value
  validate :verify_uuid_format

  def verify_uuid_format
    uuid_regex = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/
    return true if uuid_regex.match?(machine_id.to_s.downcase)
    errors.add(:machine_id, "ID must be a valid UUID")
  end

  def format_category   
    self.category = self.category.parameterize(separator: "_") unless self.category.nil?
  end

end
