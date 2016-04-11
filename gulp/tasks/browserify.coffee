gulp = require 'gulp'
browserify = require 'browserify'
coffeeify = require 'coffeeify'
coffee = require 'gulp-coffee'
source = require 'vinyl-source-stream'
plumber = require 'gulp-plumber'
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
  .pipe gulp.dest config.build.javascripts
