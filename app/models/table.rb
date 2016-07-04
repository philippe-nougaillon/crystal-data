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

	def files_size
		sizeInMB = 0.00
		self.fields.Fichier.each do |f| 
			f.values.each do |v| 
				sizeInMB += (File.size("public/table_files/#{v.data}").to_f / 2**20) if v.data
			end
		end
		return sizeInMB.round(2)
	end

	def files_count
		i = 0
		self.fields.fichier.each do |f| 
			f.values.each do |v| 
				i += 1 if v.data
			end
		end
		return i
	end

	def shared_with(user)
		users = self.users.pluck(:name)
		users -= [user.name]
		return users.join(', ')
	end

end
