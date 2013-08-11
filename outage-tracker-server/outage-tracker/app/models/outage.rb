class Outage < ActiveRecord::Base

  self.table_name = 'outage'

  validates :outage_id, :description, :start_date, :end_date, presence: true
  validates :outage_id, uniqueness: true

end
