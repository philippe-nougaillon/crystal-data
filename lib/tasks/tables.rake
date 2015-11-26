# encoding: utf-8

require 'csv'

namespace :tables do

    task :import, [:file_path, :filename, :user_id, :ip] => [:environment] do |t, args|
	  	@lignes = 0
	  	@importes = 0
	  	@record_index = 0

		CSV.foreach(args.file_path, headers:true, return_headers:true, col_sep:';', encoding:'iso-8859-1:UTF-8') do |row|
			if row.header_row?
				@new_table = Table.new(name:File.basename(args.filename,'.csv'))
				if @new_table.save
					@new_table.users << User.find(args.user_id)
					row.each do |key|
						@new_table.fields.create(name:key.first)
					end
				  	@fields = @new_table.fields
				end
			else
				@record_index += 1
				row.each_with_index do | key, index |
					#field = @new_table.fields.find_by(name:key.first)
					@new_table.values.create(field_id:@fields[index].id, data:key.last, record_index:@record_index)
					          # enregistre les ajouts dans l'historique
			        @new_table.fields[index].logs.create(user_id:args.user_id, record_index:@record_index, ip:args.ip, message:key.last)
				end
			  	@lignes += 1
			end
		end
		@new_table.update_attributes(record_index:@record_index)
		puts "Nbr de lignes traitées: #{@lignes} | Lignes importées: #{@record_index}"
	end
   
end