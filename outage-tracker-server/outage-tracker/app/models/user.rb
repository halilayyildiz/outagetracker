class User < ActiveRecord::Base

  self.table_name = 'user'

  validates :installation_id, presence: true, uniqueness: true

end