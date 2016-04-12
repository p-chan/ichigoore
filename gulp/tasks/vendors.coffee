gulp = require 'gulp'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
plumber = require 'gulp-plumber'
config = require '../config'

gulp.task 'vendors', ->
  gulp
    .src config.source.javascripts + 'vendors/**/*.js'
    .pipe plumber()
    .pipe concat 'lib.min.js'
    .pipe uglify()
    .pipe gulp.dest config.build.javascripts
