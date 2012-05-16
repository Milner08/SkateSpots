module SpotsHelper
	def getAddress(spot)
		string = spot.name
		string << ",#{spot.address1}"
		if !spot.address2.empty? 
			string << ",#{spot.address2}"
		end 
		if !spot.city.empty? 
			string << ",#{spot.city}"
		end 
		if !spot.postcode.empty? 
			string << ",#{spot.postcode}"
		end
		escapedString = CGI.escape string
		escapedString
	end
end
