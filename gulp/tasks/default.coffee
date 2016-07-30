gulp = require 'gulp'
config = require '../config'

gulp.task 'default', ['browserify', 'server'], ->
  gulp.watch config.source.stylesheets + '**/*.scss', ['sass']
  gulp.watch config.source.html + '**/*.pug', ['pug']
