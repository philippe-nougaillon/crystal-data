class Log < ActiveRecord::Base
  belongs_to :field
  belongs_to :user

end
