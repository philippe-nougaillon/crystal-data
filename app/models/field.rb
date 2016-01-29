class Field < ActiveRecord::Base
	include RankedModel
  	ranks :row_order, :with_same => :table_id 

	belongs_to :table
	has_many :values
	has_many :logs, dependent: :destroy

	validates_presence_of :name
	validates_presence_of :datatype

	enum datatype: [:texte, :nombre, :euros, :date, :oui_non?, :liste, :formule, :fichier, :signature]

	scope :filtres, -> { where(filtre:true)}
	scope :sommes,  -> { where(sum:true)}

	default_scope { rank(:row_order) } 

	# evaluer [1] + [2]
	def evaluate(values)
		begin
			# test si opérandes nulles 
			unless self.items.scan(/\[([^\]]+)\]/).flatten.select{|i| values[i.to_i - 1].nil? }.any?
				result = self.items.gsub(/\[([^\]]+)\]/) {|w| values[w.delete('[]').to_i - 1]}
				eval(result)
			else
				nil
			end
		rescue ArgumentError => se	
			"#{se}: #{result}"
		rescue TypeError => se
			"#{se}: #{result}"
		rescue SyntaxError => se
			"#{se}: #{result}"
		end
	end

	def save_file(uploaded_io)
		pathname = Rails.root.join('public', 'table_files') 
			
        filename = DateTime.now.to_s(:compact) + '__' + uploaded_io.original_filename
        File.open(pathname + filename, 'wb') do | file |
            file.write(uploaded_io.read)
        end
        filename
	end

	def delete_file(filename)
		pathname = Rails.root.join('public', 'table_files') 
		File.delete(pathname + filename) 
	end	

end
