# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	# display errors
	def errors_for(object, attribute)
    if errors = object.errors.on(attribute)
	    errors = [errors] unless errors.is_a?(Array)
	    return "<ul>" + errors.map {|e| "<li> &rsaquo; " + e + "</li>"}.join + "</ul>"
    end
  end
end
