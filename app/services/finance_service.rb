class FinanceService < BaseService
	def fetch_today_stock_action
		result = Hash.new
		result["TopGainer"] = Array.new
		result["TopLooser"] = Array.new
		result["FiftyTwoWeekHigh"] = Array.new
		result["FiftyTwoWeekLow"] = Array.new
		result["MostActiveStock"] = Array.new
	
		doc = Nokogiri::HTML(open('http://www.moneycontrol.com/stocksmarketsindia/'))
		doc.xpath('//div[@id="tsma"]').each do |link|
			link.xpath('./div/div/div[@id="tsma_tab_content_1"]/div[@id="tsma_tabs_cont_2"]//tr').each_with_index do |link1, index|
				if(index > 0)
					hash  = Hash.new
					hash["Company"] 				= clean_result link1.at_xpath("./td[1]/a") 
					hash["CurrentPrice"] 		= clean_result link1.at_xpath("./td[2]") 
					hash["GainPercentage"] 	= clean_result link1.at_xpath("./td[3]") 
					result["TopGainer"] << hash
				end
			end

			link.xpath('./div/div/div[@id="tsma_tab_content_2"]/div[@id="tsma_tabs_cont_14"]//tr').each_with_index do |link1, index|
				if(index > 0)
					hash  = Hash.new
					hash["Company"] 				= clean_result link1.at_xpath("./td[1]/a") 
					hash["CurrentPrice"] 		= clean_result link1.at_xpath("./td[2]") 
					hash["LossPercentage"] 	= clean_result link1.at_xpath("./td[3]") 
					result["TopLooser"] << hash
				end
			end

			link.xpath('./div[2]/div/div[@id="tsma_tab_content_5"]/div[@id="tsma_tabs_cont_8"]//tr').each_with_index do |link1, index|
				if(index > 0)
					hash  = Hash.new
					hash["Company"] 	= clean_result link1.at_xpath("./td[1]/a") 
					hash["DaysHigh"] 	= clean_result link1.at_xpath("./td[2]") 
					hash["Current"] 	= clean_result link1.at_xpath("./td[3]") 
					result["FiftyTwoWeekHigh"] << hash
				end
			end
			link.xpath('./div[2]/div/div[@id="tsma_tab_content_6"]/div[@id="tsma_tabs_cont_18"]//tr').each_with_index do |link1, index|
				if(index > 0)
					hash  = Hash.new
					hash["Company"] 	= clean_result link1.at_xpath("./td[1]/a") 
					hash["DaysLow"] 	= clean_result link1.at_xpath("./td[2]") 
					hash["Current"] 	= clean_result link1.at_xpath("./td[3]") 
					result["FiftyTwoWeekLow"] << hash
				end
			end

			link.xpath('./div[3]/div/div[@class="tsma_tab_content"]/div[@id="tsma_tabs_cont_6"]//tr').each_with_index do |link1, index|
				if(index > 0)
					hash  = Hash.new
					hash["Company"] = clean_result link1.at_xpath("./td[1]/a") 
					hash["Current"] = clean_result link1.at_xpath("./td[2]") 
					hash["Value"] 	= clean_result link1.at_xpath("./td[3]") 
					result["MostActiveStock"] << hash
				end
			end
		end
		result
	end

	def fetch_money_control
		result = Array.new
		doc = Nokogiri::HTML(open('http://www.moneycontrol.com/news/news-All.html'))
		
			args = ['./div/div[@class="ohidden"]/h2/a', './div/div[@class="ohidden"]/p', './div/div[@class="ohidden"]/h2/a/@href', './div/div[@class="FL MR10 PR"]/a/img/@data-original']
			parse doc, '//ul[@class="nws_listing"]//li',args do |hash|
					result << hash
			end
		result
	end

	def fetch_et
		result = Array.new
		doc = Nokogiri::HTML(open('http://economictimes.indiatimes.com/etlatestnewsupdate.cms'))
		
			args = ['./a', './p', './a/@href', './a/img/@data-original']
			parse doc, '//li',args do |hash|
					result << hash
			end
		result
	end

	

end
