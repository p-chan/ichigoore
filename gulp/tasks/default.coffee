gulp = require 'gulp'
config = require '../config'

gulp.task 'default', ['server'], ->
  console.log 'Hello from ichigoore.'
  gulp.watch config.source.stylesheets + '**/*.scss', ['sass']
  gulp.watch config.source.javascripts + '**/*.coffee', ['browserify']
