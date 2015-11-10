# encoding: utf-8

require 'csv'

namespace :tables do

    task :import, [:file_path, :filename, :user_id] => [:environment] do |t, args|
	  	@lignes = 0
	  	@importes = 0
	  	@errors = 0	
	  	@record_index = 0

		CSV.foreach(args.file_path, headers:true, return_headers:true, col_sep:';', encoding:'iso-8859-1:UTF-8') do |row|
			if row.header_row?
				@new_table = Table.new(name:File.basename(args.filename,'.csv'), user_id:args.user_id)
				if @new_table.save
					row.each do |key|
						@new_table.fields.create(name:key.first)
					end
				end
			else
				@record_index += 1
				row.each do |key|
					field = @new_table.fields.find_by(name:key.first)
					@new_table.values.create(field:field, data:key.last, record_index:@record_index)
				end
			  	@lignes += 1
			end
		end
		@new_table.update_attributes(record_index:@record_index)
		puts "Nbr de lignes traitées: #{@lignes} | Lignes importées: #{@record_index} - Erreurs: #{@errors}"
	end
   
end