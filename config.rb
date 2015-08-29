###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

#recommended
day1 = Dir.glob(source_dir + "/images/day1/**")
day1.each do |d|
  name = File.basename(d)
  puts name
  proxy "/day1/#{name}/index.html", "/proxy_templates/article.html", :locals => { :path => d }, :ignore=>true
end

day2 = Dir.glob(source_dir + "/images/day2/**")
day2.each do |d|
  name = File.basename(d)
  proxy "/day2/#{name}/index.html", "/proxy_templates/article.html", :locals => { :path => d }, :ignore=>true
end

day3 = Dir.glob(source_dir + "/images/day3/**")
day3.each do |d|
  name = File.basename(d)
  proxy "/day3/#{name}/index.html", "/proxy_templates/article.html", :locals => { :path => d }, :ignore=>true
end

day4 = Dir.glob(source_dir + "/images/day4/**")
day4.each do |d|
  name = File.basename(d)
  proxy "/day4/#{name}/index.html", "/proxy_templates/article.html", :locals => { :path => d }, :ignore=>true
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  set :slim, { :pretty => true, :sort_attrs => false, :format => :html5 }

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :autoprefixer do |config|
  config.browsers = [
    'Explorer >= 10',
    'Android >= 4.0',
    'iOS >= 8.0'
  ]
  config.cascade  = false
  config.inline   = true
  config.ignore   = []
end

#rails-assets
source 'https://rails-assets.org' do
  gem 'rails-assets-jquery'
  gem 'rails-assets-normalize-css'
  gem 'rails-assets-ua-parser-js'
end