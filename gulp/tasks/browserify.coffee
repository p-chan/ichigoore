gulp = require 'gulp'
browserify = require 'browserify'
buffer = require 'vinyl-buffer'
coffeeify = require 'coffeeify'
coffee = require 'gulp-coffee'
plumber = require 'gulp-plumber'
source = require 'vinyl-source-stream'
uglify = require 'gulp-uglify'
notify = require 'gulp-notify'
config = require '../config'

gulp.task 'browserify', ->
  browserify
    extensions: ['.coffee']
    entries: [config.source.javascripts + 'app.coffee']
  .transform coffeeify,
    bare: false
    header: false
  .bundle()
  .pipe plumber({errorHandler: notify.onError("Error: <%= error.message %>")})
  .pipe source 'app.js'
  .pipe buffer()
  .pipe uglify()
  .pipe gulp.dest config.build.javascripts
