# encoding: utf-8

class API::V1::TablesController < ApplicationController
	require 'open-uri'
	require 'sanitize'

	def index
		@user = User.find(params[:user_id])
		@tables = @user.tables
		render json: @tables
	end

	def courses
		# ouvre le lien dans le parseur
		url = "http://www.cif-ffc.org/menuCif/infospubliquesbdd/calendriers/route/calrouterecapsite.php"
		doc = Nokogiri::HTML(open(url))

		# ne garder que le texte
		text_data = doc.xpath("//text()")

		# lire les tableaux (une ligne de course = un tableau d'une ligne !)
		lines = Sanitize.clean(text_data.last, :elements => ['table','td']).split("<table>")

		# Stocke les colonnes des courses dans un tableau
		courses = []
		lines.each do | l | 
			colonnes = l.split('<td>')
			courses << {date:Sanitize.clean(colonnes[1]).strip, 
						organisateur:Sanitize.clean(colonnes[2]).strip, 
						lieu:Sanitize.clean(colonnes[3]).strip, 
						challenge:Sanitize.clean(colonnes[4]).strip, 
						categorie:Sanitize.clean(colonnes[5]).strip,
						limite:Sanitize.clean(colonnes[6]).strip}
		end

		# sauter le premier élément qui est d'ordinaire vide
		courses.shift

		# renvoyer le tableau en json (dans l'order inverse, du plus récent au plus ancien)
		render json: courses.reverse
	end

	def resultats
		# ouvre le lien dans le parseur
		url = "http://www.cif-ffc.org/menuCif/infospubliquesbdd/eprdateresult.php"
		doc = Nokogiri::HTML(open(url))

		links = []

		# pour chaque lien
		doc.xpath("//a").each do | l | 
			# que les pages ayant un lien vers les résultats
			if l.to_s.include?('RESULTATS')
				# trouve le lien
				link = l.to_s.split('"')[1]
				
				# extraire la date
				begin
					date_course = I18n.l(Date.parse(link[27..34]))	

					# si lieu, extraire le lieu, le lien vers la page résultat
					if lieu_categorie = link[35..-1]
						lieu_categorie = lieu_categorie.split('.pdf').first
						if lieu_categorie.include?('-')
							lieu = lieu_categorie.split('-').first
							categorie = lieu_categorie.split('-').last
							categorie = categorie.gsub("min","Minimes ") 
							categorie = categorie.gsub("cad","Cadets ") 
							categorie = categorie.gsub("jun","Juniors ") 
							categorie = categorie.gsub("sen","Seniors ") 
							categorie = categorie.gsub("fem","Dames ") 
							categorie = categorie.gsub("dep","Départementales ") 
						else
							lieu = lieu_categorie
							categorie = ''
						end
							
						page_resultat = link.split('/')[3]
						links << {date:date_course, lieu:lieu.upcase, link:page_resultat, cat:categorie}
					end
				rescue 
					next
				end	
			end
		end

		# retourne les 30 premiers liens
		render json: links.first(50)
	end

end