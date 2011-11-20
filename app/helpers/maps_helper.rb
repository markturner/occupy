module MapsHelper

  def google_map_tag(options={})
    options.reverse_merge!(width: 600, height: 450, mark_center: true, zoom: 10)
    static_map_tag = image_tag(static_map_url(options), width: options[:width], height: options[:height], alt: "Map for #{options[:LatLng]}")
    content_tag(:div, static_map_tag, id: options[:id],
      data: {
        googlemap: true,
        size: "#{options[:width]}x#{options[:height]}",
        latLng: options[:LatLng],
        marker: true,
        zoom:   options[:zoom]
      }
    ).html_safe
  end

  def static_map_url(options)
    map_params = [].tap do |p|
      p << ["size",    "#{options[:width]}x#{options[:height]}"]
      p << ["zoom",    options[:zoom]]
      p << ["center",  options[:LatLng]]
      p << ["markers", options[:LatLng]] if options[:mark_center]
      p << ["maptype", "roadmap"]
      p << ["sensor",  "false"]
    end

    "http://maps.google.com/maps/api/staticmap?" + map_params.map { |p| k,v=*p; "#{k}=#{CGI.escape(v.to_s)}"  }.join("&")
  end

end
