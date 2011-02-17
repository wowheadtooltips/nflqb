class Rating < ActiveRecord::Base
	
	# form validation
	validates_presence_of :attempts, :completions, :yards, :touchdowns, :interceptions
=begin
	validates_numericality_of :attempts, :only_integer => true, :greater_than_or_equal_to => 0
	validates_numericality_of :completions, :only_integer => true, :greater_than_or_equal_to => 0
	validates_numericality_of :yards, :only_integer => true, :greater_than_or_equal_to => 0
	validates_numericality_of :touchdowns, :only_integer => true, :greater_than_or_equal_to => 0
	validates_numericality_of :interceptions, :only_integer => true, :greater_than_or_equal_to => 0
=end	
end
