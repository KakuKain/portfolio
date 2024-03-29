require 'compass/import-once/activate' 
# Require any additional compass plugins here. 

require 'breakpoint' 
require 'susy' 

# Set this to the root of your project when deployed: 
http_path = "/" 
css_dir = "css" 
sass_dir = "sass" 
images_dir = "images" 
javascripts_dir = "js" 

# You can select your preferred output style here (can be overridden via the command line): 
# output_style = :expanded or :nested or :compact or :compressed 
output_style = :compressed 

# To enable relative paths to assets via compass helper functions. Uncomment: 
relative_assets = true 

# To disable debugging comments that display the original location of your selectors. Uncomment: 
line_comments = false 

# If you prefer the indented syntax, you might want to regenerate this 
# project again passing --syntax sass, or you can uncomment this: 
# preferred_syntax = :sass 
# and then run: 

Encoding.default_external = "utf-8" 
sourcemap = true 


# Compass sprite
# Make a copy of sprites with a name that has no uniqueness of the hash.
on_sprite_saved do |filename|
  if File.exists?(filename)
    FileUtils.mv filename, filename.gsub(%r{-s[a-z0-9]{10}\.png$}, '.png')
  end
end
 
# Replace in stylesheets generated references to sprites
# by their counterparts without the hash uniqueness.
on_stylesheet_saved do |filename|
  if File.exists?(filename)
    css = File.read filename
    File.open(filename, 'w+') do |f|
      f << css.gsub(%r{-s([a-z0-9]{10})\.png}, '.png?v\1')
    end
  end
end