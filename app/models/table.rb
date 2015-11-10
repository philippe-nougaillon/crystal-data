class Table < ActiveRecord::Base

	belongs_to :user

	has_many :fields, dependent: :destroy
	has_many :values, dependent: :destroy
	has_many :projects
	has_many :logs, through: :fields, dependent: :destroy

	validates_presence_of :name

	def size
		self.values.group(:record_index).count.size
	end
end
