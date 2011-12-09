module ApplicationHelper
  def title
    base_title = "Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
#    logo_html = "<object type='image/svg+xml' data='/assets/3L.svg'>"
    logo_html = image_tag( "3L.svg", {:alt => "Sample App", :class => "round"} )
#    logo_html += "</object>"
    return logo_html.html_safe
  end
end
