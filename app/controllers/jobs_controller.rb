class JobsController < ApplicationController
	
	def index
	end

	def show
	end

	def create
		job_id 
		Job.create(:guid => params.keys[0], )
	end

end
