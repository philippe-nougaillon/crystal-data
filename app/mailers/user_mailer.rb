class UserMailer < ApplicationMailer
	default from: "notification@crystaldata.net"

	def notification(table, items)
		@items = items
		@table = table
		@user = table.users.first

		mail(to: @user.email, subject: "Nouveau contenu '#{@table.name}'")
	end

end
