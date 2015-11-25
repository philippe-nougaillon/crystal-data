class Field < ActiveRecord::Base

	belongs_to :table
	has_many :values
	has_many :logs, dependent: :destroy

	validates_presence_of :name
	validates_presence_of :datatype

	enum datatype: [:texte, :nombre, :euros, :date, :oui_non?, :liste, :formule]

	scope :filtres, -> { where(filtre:true)}
	scope :sommes,  -> { where(sum:true)}

	def evaluate(values)
		begin
			# test si opérandes nulles 
			unless self.items.scan(/\[([^\]]+)\]/).flatten.select{|i| values[i.to_i - 1].nil? }.any?
				# evalue [1] + [2]
				result = self.items.gsub(/\[([^\]]+)\]/) {|w| values[w.delete('[]').to_i - 1]}
				return eval(result)
			else
				return nil
			end
		rescue ArgumentError => se	
			return "#{se}: #{result}"
		rescue TypeError => se
			return "#{se}: #{result}"
		rescue SyntaxError => se
			return "#{se}: #{result}"
		end
	end 	

end
