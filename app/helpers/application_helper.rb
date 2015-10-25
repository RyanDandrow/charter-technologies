module ApplicationHelper

    def config_website_name
      'Sterling Contacts'
    end

  	def generate_page_title
  		if @page_title.nil?
  			return config_website_name
  		end
  		config_website_name + " > " + @page_title
  	end

  	def get_access_level_text level
  	  case level
      when $USER_ACCESS_LEVEL_ADMIN
        return "Administrator"
      when $USER_ACCESS_LEVEL_USER
  	    return "User"
  	  else
  	    return "Unknown"
  	  end
  	end

  	def get_access_level_array
  	  [["Administrator", $USER_ACCESS_LEVEL_ADMIN], ["User", $USER_ACCESS_LEVEL_USER]]
  	end

end
