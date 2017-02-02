class English::FinanceController < ApplicationController
  def index
		@market = @service.fetch_today_stock_action
  end

	def market_action
		@result = @service.fetch_today_stock_action
		render json: @result
  end

	def money_control
		@news = News.find_by(channel: "MoneyControl", news_type: "FINANCE")["news"]
    @base = "http://www.moneycontrol.com"
	end

	def et
		@news = @service.fetch_et
	end

private
	def load_service
		@service = FinanceService.new
	end
	
end
