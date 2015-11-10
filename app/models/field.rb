class Field < ActiveRecord::Base
	belongs_to :table
	has_many :values
	has_many :logs

	validates_presence_of :name
	validates_presence_of :datatype

	enum datatype: [:texte, :nombre, :euros, :date, :oui_non?, :liste]

	scope :filtres, -> { where(filtre:true)}
	scope :sommes, -> { where(sum:true)}

end
