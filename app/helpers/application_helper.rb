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

    def get_urgent
      [ ["yes"], ["no"] ]
    end

    def sort_link title, column, options = {}
      condition = options[:unless] if options.has_key?(:unless)
      icon_to_show_html = "<div class='table-header-icon'>&nbsp;</div>".html_safe
      if params[:c].to_s == column.to_s
        icon_to_show = params[:d] == 'down' ? 'chevron-up' : 'chevron-down'
        icon_to_show_html = "<div class='table-header-icon glyphicon glyphicon-#{icon_to_show}'></div>".html_safe
      end
      sort_dir = params[:d] == 'down' ? 'up' : 'down'
      link_to_unless(condition, title, request.parameters.merge({:c => column, :d => sort_dir})) + icon_to_show_html
    end

    def table_cell_link contents, link, options = {}

      if options.key? :truncate
        contents = truncate(contents, :length => options[:truncate], :omission => "...")
      end

      link_to "#{contents}".html_safe, link, options
    end

    def table_cell_no_link contents, options = {}

      if options.key? :truncate
        contents = truncate(contents, :length => options[:truncate], :omission => "...")
      end

      "<div class='no-link'>#{contents}</div>".html_safe
    end

    def span_icon icon_name
      "<span class='glyphicon glyphicon-#{icon_name}' title='#{icon_name.titleize}'></span>"
    end

    def show_icon icon_name
      "<div class='icon'>#{span_icon icon_name}</div>".html_safe
    end

    def show_row_icon icon_name
      "<div class='iconRow'>#{span_icon icon_name}</div>".html_safe
    end

end
