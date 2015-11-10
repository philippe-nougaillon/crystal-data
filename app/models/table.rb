class Table < ActiveRecord::Base

	has_and_belongs_to_many :users

	has_many :fields, dependent: :destroy
	has_many :values, dependent: :destroy
	has_many :projects
	has_many :logs, through: :fields, dependent: :destroy

	validates_presence_of :name

	def size
		self.values.group(:record_index).count.size
	end
end
