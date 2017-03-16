Rails.application.routes.draw do
  root "english/latest_news#index"

	namespace :english do
		get "latest_news" => "latest_news#index"
		get "latest_news/in_latest" => "latest_news#in_latest"
		get "latest_news/zee_latest" => "latest_news#zee_latest"
		get "latest_news/ndtv_latest" => "latest_news#ndtv_latest"
		get "latest_news/toi_latest" => "latest_news#toi_latest"
		get "latest_news/oneindia_latest" => "latest_news#oneindia_latest"

		get "finance" => "finance#index"
		get "finance/money_control" => "finance#money_control"
		get "finance/et" => "finance#et"
		get "finance/zee" => "finance#zee"
		get "finance/market_action" => "finance#market_action"

		get "cricket" => "cricket#index"
		get "cricket/cb" => "cricket#cb"
		get "cricket/espn" => "cricket#espn"
	end
	namespace :hindi do
		get "latest_news" => "latest_news#index"
		get "latest_news/dainik" => "latest_news#dainik"
		get "latest_news/ndtv" => "latest_news#ndtv"
		get "latest_news/zee" => "latest_news#zee"
		get "latest_news/abp" => "latest_news#abp"
	end
	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
