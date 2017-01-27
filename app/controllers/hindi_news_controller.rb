class HindiNewsController < ApplicationController
  def index
  end

	def dainik
		@news = @service.fetch_dainik
    @base = "http://www.jagran.com"
  end

	def ndtv
		@news = @service.fetch_ndtv
	end

private
	def load_service
		@service = HindiNewsService.new
		@base = ""
    @img_base = ""
	end
	
end
