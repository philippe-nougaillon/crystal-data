class Value < ApplicationRecord
  audited

  belongs_to :field
 	
  scope :records_at, ->(i) { where(record_index:i) }
  scope :record_at,  ->(i) { find_by(record_index:i) }

  private
  	def log_update
  		logger.debug "DEBUG changes:#{self.changes}"
  	end

end
