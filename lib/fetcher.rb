
require 'nokogiri'
require 'open-uri'
class Fetcher
attr_reader :doc
	def initialize(number)
			@number=number
			@doc = Nokogiri::HTML(open("http://www.bsuir.by/schedule/schedule.xhtml?id=#{number}"))
	end
		def fetch
			links = doc.xpath("/html/body/form[@id='tableForm']/span[@id='tableForm:schedulePanel']//div[@id='tableForm:tableForm:table']/div[@class='ui-datatable-tablewrapper']/table/tbody[@id='tableForm:tableForm:table_data']/tr/td/a")
			names = links.map(&:content).uniq

			puts names
		end
end