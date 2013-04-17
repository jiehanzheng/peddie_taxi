module ApplicationHelper

  class BootstrapNavTabBuilder < TabsOnRails::Tabs::Builder
    def open_tabs(options = {})
      @context.tag("ul", { :class => "nav" }, open = true)
    end

    def close_tabs(options = {})
      "</ul>".html_safe
    end

    def tab_for(tab, name, options, item_options = {})
      item_options[:class] = (current_tab?(tab) ? 'active' : '')
      @context.content_tag(:li, item_options) do
        @context.link_to(name, options)
      end
    end
  end


  def static_map_url(lat, lon, options = {})
    height = options[:height] || 90
    width = options[:width] || 90
    name = options[:name] || "Location"

    api_params = { :scale => 2, 
                   :markers => "color:red|#{lat},#{lon}",
                   :size => "#{height}x#{width}",
                   :sensor => false,
                   :zoom => 12 }

    "//maps.googleapis.com/maps/api/staticmap?" + api_params.to_query
  end


  def static_map_tag(lat, lon, options = {})
    height = options[:height] || 90
    width = options[:width] || 90
    name = options[:name] || "Location"
    
    image_tag static_map_url(lat, lon, options),
              :size => "#{height}x#{width}",
              :alt => "#{name} on Google Maps",
              :title => "#{name} on Google Maps"
  end


  def proposal_status_badge(proposal)
    "<span class=\"label label-info\">Proposed</span>".html_safe
  end


  def active_if_val_eq(value, checked_value)
    if value == checked_value
      'active'
    end
  end


  def day_of_week_buttons(year=nil, week=nil)
    (0..6).collect do |i|
      css_class = "btn"
      css_class << " btn-info" if (5..6).include?(i)
      "<button type=\"button\" class=\"#{css_class}\" value=\"#{i}\" data-stupid-people-format=\"" + 
      Date.commercial(year,week,i+1).strftime("%B %e, %Y") + 
      '">' +
      Date.commercial(year,week,i+1).strftime("%a") +
      '</button>'
    end.join.html_safe
  end


  def official_badge(user)
    if user.official?
      '<span class="label label-info">SNA</span>'.html_safe
    end
  end
  
end
