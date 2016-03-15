gulp = require 'gulp'
imagemin = require 'gulp-imagemin'
config = require '../config'

options =
  optimizationLevel: 7
  progressive: true
  interlaced: true
  svgoPlugins: [{removeViewBox: false}]

gulp.task 'imagemin', ->
  gulp
    .src config.source.images + '**/*.+(jpg|png|gif|svg)'
    .pipe imagemin options
    .pipe gulp.dest config.build.images
