gulp = require 'gulp'
pug = require 'gulp-pug'

plumber = require 'gulp-plumber'
notify = require 'gulp-notify'

config = require '../config'

gulp.task 'pug', ->
  options =
    pretty: true
    self: config.build.html

  return gulp.src [
    config.source.html + '**/*.pug',
    '!' + config.source.html + '**/_*.pug'
  ]
  .pipe plumber({errorHandler: notify.onError("Error: <%= error.message %>")})
  .pipe pug options
  .pipe gulp.dest config.build.html
