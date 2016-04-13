gulp = require 'gulp'
config = require '../config'
runSequence  = require 'run-sequence'

gulp.task 'release', ->
  runSequence 'clean', ['browserify', 'vendors', 'sass', 'imagemin']
