# encoding: utf-8

class API::V1::UsersController < ApplicationController

	def index
		@users = User.all
		render json: @users
	end

	def timestamps
		timestamps = {}
		unless params[:user_id]
			timestamps['Name'] = "users"
			timestamps['TimeStampValue'] = User.maximum(:updated_at).to_i
		else
			timestamps['tables'] = Table.maximum(:updated_at).to_i
			timestamps['fields'] = Field.maximum(:updated_at).to_i
		end
		render json: timestamps
	end

end