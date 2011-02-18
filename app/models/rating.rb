class Rating < ActiveRecord::Base
	# form validation
	validates_presence_of :attempts, :completions, :yards, :touchdowns, :interceptions
end
