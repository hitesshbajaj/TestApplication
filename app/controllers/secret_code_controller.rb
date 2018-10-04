class SecretCodeController < ApplicationController
load_and_authorize_resource

	def index
		@codes = SecretCode.where(is_used:true)
		 respond_to do |format|
	      format.html
	    end
		# render json: @codes, root: false, status: :ok
	end

	def create
	    params[:count].to_i.times.each do
			SecretCode.create(code:SecureRandom.hex(10).upcase.at(0..5))
		end
		redirect_to all_secret_code_path
	end

	def all_codes
		@codes = SecretCode.all
		respond_to do |format|
			format.html
		end
	end

	def destroy
		@code = SecretCode.find_by_id(params[:id])
		@code.destroy
		redirect_to all_secret_code_path
	end
end
