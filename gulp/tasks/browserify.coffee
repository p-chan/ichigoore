gulp = require 'gulp'
browserify = require 'browserify'
buffer = require 'vinyl-buffer'
coffeeify = require 'coffeeify'
coffee = require 'gulp-coffee'
plumber = require 'gulp-plumber'
source = require 'vinyl-source-stream'
uglify = require 'gulp-uglify'
config = require '../config'

gulp.task 'browserify', ->
  browserify
    extensions: ['.coffee']
    entries: [config.source.javascripts + 'app.coffee']
  .transform coffeeify,
    bare: false
    header: false
  .bundle()
  .pipe plumber()
  .pipe source 'app.js'
  .pipe buffer()
  .pipe uglify()
  .pipe gulp.dest config.build.javascripts
