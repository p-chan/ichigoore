gulp = require 'gulp'
sass = require 'gulp-sass'
config = require '../config'

gulp.task 'sass', ->
  gulp.src [
      config.source.stylesheets + '**/*.scss'
      '!' + config.source.stylesheets + '**/_*.scss'
    ]
    .pipe sass()
    .pipe gulp.dest config.build.stylesheets
