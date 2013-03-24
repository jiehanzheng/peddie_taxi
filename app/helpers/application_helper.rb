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


  def static_map_tag(lat, lon, options = {})
    height = options[:height].blank? ? 90 : options[:height]
    width = options[:width].blank? ? 90 : options[:width]
    name = options[:name].blank? ? "Location" : options[:name]

    api_params = { :scale => 2, 
                   :markers => "color:red|#{lat},#{lon}",
                   :size => "#{height}x#{width}",
                   :sensor => false,
                   :zoom => 12 }
    image_tag "//maps.googleapis.com/maps/api/staticmap?" + api_params.to_query,
              :size => "#{height}x#{width}",
              :alt => "#{name} on Google Maps",
              :title => "#{name} on Google Maps"
  end


  def proposal_status_badge(proposal)
    "<span class=\"label label-info\">Proposed</span>".html_safe
  end
  
end
