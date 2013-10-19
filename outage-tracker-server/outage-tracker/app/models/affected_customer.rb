class AffectedCustomer < ActiveRecord::Base

  self.table_name = 'affected_customers'

  validates :outage_id, :inst_id, presence: true

end
