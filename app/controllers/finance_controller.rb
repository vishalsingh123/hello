class FinanceController < ApplicationController
  def index
  end

	def market_action
		@result = @service.fetch_today_stock_action
		render json: @result
  end

private
	def load_service
		@service = FinanceService.new
	end
	
end
