class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	before_action :load_service, :load_sensex


private
	def load_service
	end

	def load_sensex
		@sensex = BaseService.new.fetch_sensex
		@style_class = (@sensex[2].starts_with?("-")) ? "text-danger" : "text-success"
	end
end
