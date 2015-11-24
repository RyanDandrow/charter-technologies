module ApplicationHelper

    def config_website_name
      'Sterling Contacts'
    end

  	def generate_page_title
  		return config_website_name
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

    def pagination_details objs
      " <small class='pagination-details'>/ page #{objs.current_page} of #{objs.total_pages}</small>".html_safe if objs.current_page && objs.total_pages > 1
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

    def f_text_field f, obj, attribute, options = {}
      f_form_tag_wrapper(f.text_field(attribute, strip_f_options(options_hash_with_merged_classes(options, 'form-control'))), f, obj, attribute, options).html_safe
    end

    def f_password_field f, obj, attribute, options = {}
      f_form_tag_wrapper(f.password_field(attribute, strip_f_options(options_hash_with_merged_classes(options, 'form-control'))), f, obj, attribute, options).html_safe
    end

    def f_select f, obj, attribute, option_tags, options = {}
      f_form_tag_wrapper(f.select(attribute, option_tags, strip_f_options(options), merged_class_hash(options, 'form-control')), f, obj, attribute, options).html_safe
    end


    protected

    def strip_f_options options
      options.reject {|key, value| key.to_s.include? "f_" }
    end

    def merged_class_hash options, new_class
      if options.key? :class
        new_class += " #{options[:class]}"
      end
      
      {:class => new_class}
    end

    def options_hash_with_merged_classes options, new_class
      if options.key? :class
        new_class += " #{options[:class]}"
      end
      options[:class] = new_class
      options
    end

    def f_form_tag_wrapper form_tag, f, obj, attribute, options = {}
      unless options.key? :f_label
        human_attribute_name = attribute.to_s.humanize
      else
        human_attribute_name = options[:f_label]
      end

      sublabel = ""

      if options.key? :f_sublabel
        sublabel = " <small>#{options[:f_sublabel]}</small>".html_safe
      end

      html = ""

      if obj && obj.errors[attribute].any?
        html += "<div class='form-group has-error'>"
        html += f.label(attribute, "#{human_attribute_name} #{obj.errors[attribute].first}".html_safe, :class => "control-label")
      else
        html += "<div class='form-group'>"
        html += f.label(attribute, "#{human_attribute_name}#{sublabel}".html_safe, :class => "control-label")
      end

      html += "<div class='control'>#{form_tag}</div></div>"

    end

end
