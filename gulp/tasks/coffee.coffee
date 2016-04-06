gulp = require 'gulp'
coffee = require 'gulp-coffee'
config = require '../config'

gulp.task 'coffee', ->
  gulp.src config.source.javascripts + '*.coffee'
    .pipe coffee({bare: true})
    .pipe gulp.dest config.build.javascripts
