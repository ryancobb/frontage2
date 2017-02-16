class SeleniumController < ApplicationController

	def specs
		response = HTTParty.get("http://localhost:3000/selenium/specs")
		@specs = JSON.parse(response.body)
	end

	def run
		body = {
			:selenium => {
				:spec => params[:specs],
				:environment => params[:environment],
				:browser => params[:browser]
			}
		}

		response = HTTParty.post("http://localhost:3000/selenium/run", 
			:body => body.to_json,
			:headers => { 'Content-Type' => 'application/json' })

		redirect_to root_path
	end	
end
