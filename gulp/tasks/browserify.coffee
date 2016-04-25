gulp = require 'gulp'
browserify = require 'browserify'
buffer = require 'vinyl-buffer'
coffeeify = require 'coffeeify'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
plumber = require 'gulp-plumber'
source = require 'vinyl-source-stream'
uglify = require 'gulp-uglify'
notify = require 'gulp-notify'
watchify = require 'watchify'
config = require '../config'

gulp.task 'browserify', ->
  options =
    entries: [config.source.javascripts + 'app.coffee']
    extensions: ['.coffee']
    cache: {}
    packageCache: {}

  bundler = watchify browserify options
  bundler.on 'log', gutil.log

  handleErrors = () ->
    args = Array.prototype.slice.call arguments
    notify.onError
      title: "Compile Error",
      message: "<%= error.message %>"
    .apply this, args
    this.emit 'end'

  bundle = ->
    bundler
      .bundle()
      .on 'error', handleErrors
      .pipe plumber({errorHandler: notify.onError("Error: <%= error.message %>")})
      .pipe source 'app.js'
      .pipe buffer()
      .pipe uglify()
      .pipe gulp.dest config.build.javascripts

  bundler.on 'update', bundle
  bundle()
