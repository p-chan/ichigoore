gulp = require 'gulp'
config = require '../config'

gulp.task 'default', ['browserify', 'vendors', 'server'], ->
  gulp.watch config.source.stylesheets + '**/*.scss', ['sass']
  gulp.watch config.source.javascripts + 'vendors/**/*.js', ['vendors']
