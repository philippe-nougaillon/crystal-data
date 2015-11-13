class Table < ActiveRecord::Base

	has_and_belongs_to_many :users

	has_many :fields, dependent: :destroy
	has_many :values, dependent: :destroy
	has_many :logs, through: :fields, dependent: :destroy

	validates :name, presence: true

	def size
		self.values.group(:record_index).count.size
	end

	def is_owner?(user)
		self.users[0] == user
	end
end
