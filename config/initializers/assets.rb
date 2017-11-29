# Be sure to restart your server when you modify this file.
files = %w(top divisions games members results topics for_members link lab/data lab/seminars
lab/practice_logs admin/divisions admin/games admin/members admin/results admin/topics admin/top
jquery.bxslider admin/schools admin/colleges accounts admin/released_infos admin/images
admin/image_targets images released_infos lab/top)
css_files = %w{}
js_files = %w{}
files.each { |e|
  css_files << "#{e}.css"
  js_files << "#{e}.js"
}
# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += css_files
Rails.application.config.assets.precompile += js_files
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
