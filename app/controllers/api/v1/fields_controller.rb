# encoding: utf-8

class API::V1::FieldsController < ApplicationController

	def index
		if params[:user_id]
			@user = User.find(params[:user_id])
			@fields = @user.fields.order(:row_order)
		else
			@table = Table.find(params[:table_id])
			@fields = @table.fields.order(:row_order)
		end
		render json: @fields
	end

end