class HindiNewsService < BaseService

	def fetch_dainik
		result = Array.new
		doc = Nokogiri::HTML(open('http://www.jagran.com/'))
		doc.xpath('//div[@class="main-pager"]').each do |link|
			link.xpath('//ul[@class="tabbox"]//li').each do |link1|
				res_hash = Hash.new
  			res_hash["Title"] 			= clean_result link1.at_xpath('./a[1]/span[2]')
  			res_hash["Description"] = clean_result link1.at_xpath('./p')
  			res_hash["Link"]  			= clean_result link1.at_xpath('./a[1]/@href')
  			res_hash["ImgLink"] 		= clean_result link1.at_xpath('./a[1]/span[1]/img/@src')
				result << res_hash
    	end
		end
		result
	end

	def fetch_ndtv
		result = Array.new
		doc = Nokogiri::HTML(open('http://khabar.ndtv.com/'))
		doc.xpath('//div[@class="ndtv_leadstory"]').each do |link|
				res_hash = Hash.new
        res_hash["Title"]       = clean_result link.at_xpath('./div/div/h1/a')
        res_hash["Description"] = clean_result link.at_xpath('./p')
        res_hash["Link"]        = clean_result link.at_xpath('./div/div/h1/a/@href')
        res_hash["ImgLink"]     = clean_result link.at_xpath('./div/a/img/@src')
        result << res_hash
		end

		doc.xpath('//div[@class="storylist_thumb"]').each do |link|
			link.xpath('./ul//li').each do |link1|
				res_hash = Hash.new
  			res_hash["Title"] 			= clean_result link1.at_xpath('./div[@class="description"]/h2/a')
  			res_hash["Description"] = clean_result link1.at_xpath('./p')
  			res_hash["Link"]  			= clean_result link1.at_xpath('./div[@class="thumbnail"]/a/@href')
  			res_hash["ImgLink"] 		= clean_result link1.at_xpath('./div[@class="thumbnail"]/a/img/@src')
				result << res_hash
    	end
		end

		result
	end

end
