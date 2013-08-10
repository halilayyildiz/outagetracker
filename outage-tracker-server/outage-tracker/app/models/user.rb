class User < ActiveRecord::Base

  self.table_name = 'user'

  validates :device_id, :installation_id, :presence => true
  validates_uniqueness_of :installation_id

end