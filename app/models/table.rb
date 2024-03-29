class Table < ApplicationRecord
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

	audited

	has_and_belongs_to_many :users
	has_many :fields, dependent: :destroy
	has_many :values, through: :fields, dependent: :destroy
	has_many :logs, through: :fields, dependent: :destroy

	validates :name, presence: true

	# Donne le nombre de ligne exact de la table 
	def size
		self.values.group("values.id, values.record_index").reorder(:id).count.size
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
		self.fields.Fichier.each do |f| 
			f.values.each do |v| 
				i += 1 if v.data
			end
		end
		return i
	end

	def shared_with(user)
		users = self.users.pluck(:name)
		users -= [user.name]
		return users.map{|u| u.humanize}.join(', ')
	end

	def value_datas(record_index)
		self.values.includes(:field).records_at(record_index).order("fields.row_order").pluck(:data)
	end

private
	# only one candidate for an nice id; one random UDID
	def slug_candidates
		[SecureRandom.uuid]
	end


end
