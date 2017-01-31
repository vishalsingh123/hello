class English::FinanceController < ApplicationController
  def index
		@market = @service.fetch_today_stock_action
  end

	def market_action
		@result = @service.fetch_today_stock_action
		render json: @result
  end

	def money_control
		@news = @service.fetch_money_control
	end

private
	def load_service
		@service = FinanceService.new
	end
	
end
