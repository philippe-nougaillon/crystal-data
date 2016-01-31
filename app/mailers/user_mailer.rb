# encoding: utf-8

class UserMailer < ApplicationMailer
	default from: '"crystalData" <notification@crystaldata.net>'

	def notification(table, items)
		@items = items
		@table = table
		user = table.users.first

		mail(to: user.email, subject: "Nouveau contenu '#{@table.name}'")
	end

	def notification_nouveau_compte(user)
		@user = user

		mail(to: @user.email, subject: "Création de compte")
	end

	def notification_nouveau_partage(user, table)
		@user = user
		@table = table

		mail(to: @user.email, subject: "Partage de la table '#{@table.name.humanize}' activé")
	end

end
