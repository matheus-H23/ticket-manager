# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( admin.js admin.css
                                                  home.js home.scss
                                                  kind.js kind.scss
                                                  devise/devise.js devise/devise.scss
                                                  account/base.scss
                                                  account/tickets.js account/tickets.scss
                                                  account/user.js account/user.scss
                                                  manager/tickets.js manager/tickets.scss
                                                  manager/kinds.js manager/kinds.scss
                                                  manager/base.scss
                                                  manager/users.js manager/users.scss
                                                  tickets.js tickets.scss
                                                  notify.js)
