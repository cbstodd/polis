# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.lowdown.site"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)

  # Defaults:
  #     :priority => 0.5, :changefreq => 'weekly',
  #     :lastmod => Time.now, :host => default_host

  # Examples:
  add '/',        :changefreq => 'daily',   :priority => 0.9
  add '/events',  :changefreq => 'daily',   :priority => 0.8
  add '/about',   :changefreq => 'monthly', :priority => 0.7
  add '/users',   :changefreq => 'monthly', :priority => 0.6
  add '/contact', :changefreq => 'monthly', :priority => 0.5

  # add all articles:

    Eventpost.find_each do |event|
      add events_path(event), :lastmod => event.created_at
    end

end
