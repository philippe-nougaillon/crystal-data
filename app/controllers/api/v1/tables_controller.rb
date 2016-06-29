# encoding: utf-8

class API::V1::TablesController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@tables = @user.tables
		render json: @tables
	end

end