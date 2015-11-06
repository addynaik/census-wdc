web_path = 'public'
vendor_path = 'vendor'

config =
  dest:
    # app_path: '.app'
    web_path: '.public'
  # app_path: 'app'
  web_path: web_path
  # image_path: web_path + '/images'
  # style_path: web_path + '/styles'
  style_main_file: web_path + '/styles/app.less'
  js_path: web_path + '/js'
  js_main_file: 'app.js'
  view_path: web_path + '/views'
  bower_main_file: 'bower-vendor.js'
  bower_components_path: 'bower_components'
  vendor_main_file: 'vendor.js'
  vendor_js_path: vendor_path + '/js'
  themes_path: vendor_path + '/themes'

module.exports = config
