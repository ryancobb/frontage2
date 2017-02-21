class SeleniumController < ApplicationController

	def specs
		response = HTTParty.get("#{ALLEYWAY_CONFIG["url"]}/selenium/specs")
		@specs = JSON.parse(response.body)
	end

	def run
		body = {
			:selenium => {
				:job_guid => SecureRandom.uuid,
				:spec => params[:specs],
				:environment => params[:environment],
				:browser => params[:browser]
			}
		}

		response = HTTParty.post("#{ALLEYWAY_CONFIG["url"]}/selenium/run", 
			:body => body.to_json,
			:headers => { 'Content-Type' => 'application/json' })

		redirect_to root_path
	end	
end
