module ContactsHelper

	def get_urg_text title
	  case title
    when false
      return "No"
    when true
	    return "Yes"
	  else
	    return ""
	  end
	end

	def get_urg_array
		[
	  	['No', 'false'],
	  	['Yes', 'true']
	  ]
	end

end
