gulp    = require 'gulp'
coffee  = require 'gulp-coffee'
concat  = require 'gulp-concat'
gutil   = require 'gulp-util'
jade    = require 'gulp-jade'
path    = require 'path'
less    = require 'gulp-less'
uglify  = require 'gulp-uglify'
mainBowerFiles = require 'main-bower-files'
serve   = require 'gulp-serve'
nodemon = require 'gulp-nodemon'

parameters = require '../config/parameters.coffee'

gulp.task 'jade', ->
  gulp.src parameters.view_path + '/*.jade'
  .pipe jade pretty: true
  .pipe gulp.dest parameters.dest.web_path + '/views'
  .on 'error', gutil.log

gulp.task 'coffee', ->
  gulp.src parameters.js_path+'/**/*.coffee'
  .pipe coffee bare: true
  .pipe concat parameters.js_main_file
  .pipe gulp.dest parameters.dest.web_path+'/js'
  .on 'error', gutil.log

gulp.task 'less', ->
  gulp.src [parameters.style_main_file]
  .pipe less paths: [ path.join(__dirname), parameters.bower_components_path, parameters.themes_path ]
  .pipe gulp.dest parameters.dest.web_path+'/styles'
  .on 'error', gutil.log

gulp.task 'minify',
  ['bower','coffee'],
  ->
    gulp.src parameters.dest.web_path+'/js/**.js'
    .pipe uglify outSourceMap: true
    .pipe gulp.dest parameters.dest.web_path+'/js'
    .on 'error', gutil.log

gulp.task 'bower', ->
    gulp.src mainBowerFiles('**/*.js')
      .pipe concat parameters.bower_main_file
      .pipe gulp.dest parameters.dest.web_path+'/js'
      .on 'error', gutil.log

gulp.task 'build', ['jade','coffee','less','bower']

gulp.task 'watch', ['build'], # After all build tasks are done
  ->
    gulp.watch parameters.web_path + '/**/*.coffee', ['coffee']
    gulp.watch parameters.web_path + '/**/*.less', ['styles']
    gulp.watch parameters.web_path + '/**/*.jade', ['jade']

gulp.task 'dist', ['build','minify']

gulp.task 'dev', ['watch'], ->
  nodemon
    'script': 'server.js'
