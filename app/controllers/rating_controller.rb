class RatingController < ApplicationController
  def index
  	# see if they submitted the form
  	if !params[:commit].nil? && params[:commit].downcase.gsub('!', '') == 'calculate'
  		fields = params[:rating]						# get the field values from the form input
  		fields.each {|key, value| fields[key] = Float(value)}
  		@errors = validate_fields(fields)		# perform basic validation

  		# if there were no errors, we can continue
  		if !@errors.nil? && @errors != false
  			# setup a variable for each field value	
  			attempts = fields[:attempts]
  			completions = fields[:completions]
  			yards = fields[:yards]
  			touchdowns = fields[:touchdowns]
  			interceptions = fields[:interceptions]
  			
  			# calculations are done in 4 parts, a final calculation determining the passer rating
  			# also we'll make sure the results are < 2.375 and > 0, and adjust if not
  			completions_per = in_range((completions / attempts - 0.3) * 5.0)																	# completion percentage
  			yards_per = in_range((yards / attempts - 3.0) * 0.25)																							# yards per attempt
  			touchdowns_per = in_range((touchdowns / attempts) * 20.0)																					# percentage of touchdown passes
  			interceptions_per = in_range(2.375 - (interceptions / attempts * 25.0))														# percentage of interceptions
  			passer_rating = ((completions_per + touchdowns_per + interceptions_per + yards_per) / 6.0) * 100	# finally, the passer rating

  			# finally, create an array to make displaying easier
  			@results = {
  				:attempts => attempts,
  				:completions => completions,
  				:yards => yards,
  				:touchdowns => touchdowns,
  				:interceptions => interceptions,
  				:completions_per => completions_per.round(4).to_s,
  				:touchdowns_per => touchdowns_per.round(4).to_s,
  				:interceptions_per	=> interceptions_per.round(4).to_s,
  				:yards_per	=> yards_per.round(4).to_s,
  				:passer_rating	=> passer_rating.round(1).to_s,
  				:rating_color => passer_rating.round(1).to_s == '158.3' ? 'results-perfect' : 'results-normal',
  				:check_color => passer_rating.round(1).to_s == '158.3' ? 'checkmark-green.png' : 'checkmark-blue.png'
  			}
  		end
  	end
  end
  
private
	# make sure a field is a number and >= 0
	# if not, it will return an error message.
	def validate_fields(fields)
		errors = []
		fields.each {|key, value| errors[errors.count] = "Passing #{key.to_s} must be a floating number >= 0." if !value.is_a?(Float) || value < 0}
		return errors
	end
	
	# makes sure value is between 0 and 2.375, inclusive
	def in_range(value)
		return 2.375 if value > 2.375
		return 0 if value < 0
		return value
	end
end 