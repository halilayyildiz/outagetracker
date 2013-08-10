class Outage < ActiveRecord::Base

  self.table_name = 'Outage'

  validates :outage_id, :description, :start_date, :end_date, :presence => true
  validates_uniqueness_of :outage_id

end
