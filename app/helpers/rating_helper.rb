include ParseDate
module RatingHelper
	def server_uptime
		uptime = %x[uptime].to_s.split(' ')
		# we need to manipulate the uptime string a bit to get it to format properly
		t = uptime[0].split(':')
		u = Time.local(1984, 9, 6, t[0], t[1], t[2], 999999)
		u.strftime("%Ih %Mm %Ss")
	end
end
