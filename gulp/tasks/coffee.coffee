gulp = require 'gulp'
coffee = require 'gulp-coffee'
plumber = require 'gulp-plumber'
config = require '../config'

gulp.task 'coffee', ->
  gulp.src config.source.javascripts + '*.coffee'
    .pipe plumber()
    .pipe coffee({bare: true})
    .pipe gulp.dest config.build.javascripts
