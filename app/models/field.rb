class Field < ActiveRecord::Base

	belongs_to :table
	has_many :values
	has_many :logs

	validates_presence_of :name
	validates_presence_of :datatype

	enum datatype: [:texte, :nombre, :euros, :date, :oui_non?, :liste, :formule]

	scope :filtres, -> { where(filtre:true)}
	scope :sommes,  -> { where(sum:true)}


	def evaluate(values)
		begin
			result = self.items.gsub(/\[([^\]]+)\]/) {|w| values[w.delete('[]').to_i - 1]}
			return eval(result)
		rescue ArgumentError => se	
			return "#{se}: #{result}"
		rescue TypeError => se
			return "#{se}: #{result}"
		rescue SyntaxError => se
			return "#{se}: #{result}"
		end
	end 	

end
