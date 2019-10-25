class Value < ApplicationRecord
 	  
    belongs_to :field
 	
    scope :records_at, ->(i) { where(record_index:i) }
    scope :record_at,  ->(i) { find_by(record_index:i) }

  	#before_update :log_update

  private
  	def log_update
  		logger.debug "DEBUG changes:#{self.changes}"
  	end

end
